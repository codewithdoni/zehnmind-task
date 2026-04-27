import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';

class TaskSuggestion {
  TaskSuggestion({required this.priority, required this.categories});

  final TodoPriority priority;
  final List<String> categories;
}

@lazySingleton
class AiService {
  AiService(this._logger);

  final Logger _logger;

  /// Gemini API key. Override at run time:
  ///   flutter run --dart-define=GEMINI_API_KEY=AIza...
  static const _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  static const _categoryAllowlist = ['Work', 'Personal', 'Urgent', 'Ideas'];

  bool get isConfigured => _apiKey.isNotEmpty;

  GenerativeModel _model({required String systemInstruction, double temperature = 0.4, String? mime}) {
    return GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: temperature,
        responseMimeType: mime,
      ),
      systemInstruction: Content.system(systemInstruction),
    );
  }

  Future<TaskSuggestion> categorize({
    required String title,
    String? description,
  }) async {
    if (!isConfigured) {
      return TaskSuggestion(priority: TodoPriority.medium, categories: const []);
    }
    final prompt = 'Title: $title\nDescription: ${description ?? "(none)"}';
    try {
      final response = await _model(
        systemInstruction:
            'You are a task classification assistant. Given a task title and '
            'optional description, return a JSON object with two fields: '
            '"priority" (one of "low", "medium", "high") and '
            '"categories" (array, 0-2 items, only from this set: '
            '${_categoryAllowlist.join(", ")}). '
            'Return only JSON.',
        temperature: 0.2,
        mime: 'application/json',
      ).generateContent([Content.text(prompt)]);

      final text = response.text?.trim() ?? '{}';
      final json = jsonDecode(_stripCodeFence(text)) as Map<String, dynamic>;
      final priority = TodoPriorityX.parse(json['priority'] as String?);
      final categories = ((json['categories'] as List?) ?? const [])
          .whereType<String>()
          .where(_categoryAllowlist.contains)
          .toList();
      return TaskSuggestion(priority: priority, categories: categories);
    } catch (e, st) {
      _logger.w('AI categorize failed', error: e, stackTrace: st);
      return TaskSuggestion(priority: TodoPriority.medium, categories: const []);
    }
  }

  Future<String> summarize(List<TodoItem> completedToday) async {
    if (completedToday.isEmpty) {
      return 'No tasks completed today yet — start with a small win!';
    }
    if (!isConfigured) {
      return 'You completed ${completedToday.length} tasks today. Great work! '
          '(Add --dart-define=GEMINI_API_KEY=… for AI-powered recap.)';
    }
    final prompt = StringBuffer('Tasks completed today:\n');
    for (final t in completedToday) {
      prompt.writeln('- ${t.title}');
    }
    try {
      final response = await _model(
        systemInstruction:
            'You are a friendly productivity coach. Given a list of tasks the '
            'user completed today, write a short uplifting recap in 2-3 '
            'sentences. Reference accomplishments, recognize effort. Plain text.',
      ).generateContent([Content.text(prompt.toString())]);
      return response.text?.trim() ??
          'Great work today — ${completedToday.length} tasks done!';
    } catch (e, st) {
      _logger.w('AI summarize failed', error: e, stackTrace: st);
      return 'Great work today — ${completedToday.length} tasks done!';
    }
  }

  String _stripCodeFence(String raw) {
    var text = raw.trim();
    if (text.startsWith('```')) {
      text = text.replaceFirst(RegExp(r'^```(?:json)?\s*'), '');
      text = text.replaceFirst(RegExp(r'```\s*$'), '');
    }
    return text.trim();
  }
}
