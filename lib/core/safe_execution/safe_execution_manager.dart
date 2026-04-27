import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:zehnmind/core/error/app_exception.dart';

typedef SafeExecutionFunction<T> = Future<T> Function();

@lazySingleton
class SafeExecutionManager {
  SafeExecutionManager(this._logger);

  final Logger _logger;

  Future<T> run<T>(SafeExecutionFunction<T> fn) async {
    try {
      return await fn();
    } catch (error, stack) {
      final mapped = AppException.from(error);
      _logger.e('SafeExecution caught', error: error, stackTrace: stack);
      throw mapped;
    }
  }
}
