import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

@lazySingleton
class NotificationService {
  NotificationService(this._logger);

  final Logger _logger;
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const _channelId = 'zehnmind_tasks_channel';
  static const _channelName = 'Task reminders';
  static const _channelDesc = 'Reminders for tasks with a due date';
  static const _dailyDigestId = 1;

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    tzdata.initializeTimeZones();
    try {
      final localTz = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(localTz));
    } catch (e) {
      _logger.w('Timezone resolve failed', error: e);
    }

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
    );
    _initialized = true;
  }

  /// Asks the user for notification permissions. Returns true if granted.
  Future<bool> requestPermission() async {
    await init();
    if (Platform.isIOS) {
      final granted = await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      return granted ?? false;
    }
    final status = await Permission.notification.request();
    if (status.isGranted) {
      // Best-effort: Android 13+ exact alarm grant.
      try {
        await Permission.scheduleExactAlarm.request();
      } catch (_) {}
      return true;
    }
    return false;
  }

  NotificationDetails _details() {
    const android = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.max,
      priority: Priority.high,
    );
    const ios = DarwinNotificationDetails();
    return const NotificationDetails(android: android, iOS: ios);
  }

  Future<void> _scheduleAt({
    required int id,
    required tz.TZDateTime when,
    required String title,
    required String body,
    String? payload,
    DateTimeComponents? matchComponents,
  }) async {
    if (when.isBefore(tz.TZDateTime.now(tz.local))) return;
    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        when,
        _details(),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: matchComponents,
        payload: payload,
      );
    } catch (e, st) {
      _logger.w('Schedule notification failed', error: e, stackTrace: st);
    }
  }

  /// Schedules two notifications for a task: one at [dueDate] and one 1 hour
  /// before. Uses deterministic IDs derived from [taskId] so reschedules
  /// overwrite cleanly.
  Future<void> scheduleTaskReminder({
    required String taskId,
    required String title,
    required DateTime dueDate,
  }) async {
    await init();
    final mainId = _idForTask(taskId, isPreWarning: false);
    final preId = _idForTask(taskId, isPreWarning: true);
    final whenLocal = tz.TZDateTime.from(dueDate, tz.local);
    final preWhen = whenLocal.subtract(const Duration(hours: 1));

    await _plugin.cancel(mainId);
    await _plugin.cancel(preId);

    await _scheduleAt(
      id: mainId,
      when: whenLocal,
      title: 'Task due: $title',
      body: "It's time to wrap this up.",
      payload: taskId,
    );
    await _scheduleAt(
      id: preId,
      when: preWhen,
      title: 'Coming up: $title',
      body: 'Due in 1 hour.',
      payload: taskId,
    );
  }

  Future<void> cancelTaskReminder(String taskId) async {
    await init();
    await _plugin.cancel(_idForTask(taskId, isPreWarning: false));
    await _plugin.cancel(_idForTask(taskId, isPreWarning: true));
  }

  /// Daily 9:00 reminder summarizing the day's tasks.
  Future<void> scheduleDailyDigest({int hour = 9, int minute = 0}) async {
    await init();
    final now = tz.TZDateTime.now(tz.local);
    var when = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (when.isBefore(now)) when = when.add(const Duration(days: 1));

    await _plugin.cancel(_dailyDigestId);
    await _scheduleAt(
      id: _dailyDigestId,
      when: when,
      title: 'Plan your day ✨',
      body: 'Open Zehnmind to see what needs your attention today.',
      matchComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelDailyDigest() async {
    await init();
    await _plugin.cancel(_dailyDigestId);
  }

  Future<void> cancelAll() async {
    await init();
    await _plugin.cancelAll();
  }

  /// Maps a Firestore document id to a stable 32-bit int. The pre-warning
  /// notification gets an offset so both can co-exist.
  int _idForTask(String taskId, {required bool isPreWarning}) {
    var hash = 0;
    for (final code in taskId.codeUnits) {
      hash = (hash * 31 + code) & 0x3fffffff;
    }
    return isPreWarning ? hash | 0x40000000 : hash;
  }
}
