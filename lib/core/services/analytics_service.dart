import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AnalyticsService {
  AnalyticsService(this._analytics);

  final FirebaseAnalytics _analytics;

  Future<void> logScreen(String name) async {
    await _analytics.logScreenView(screenName: name);
  }

  Future<void> logEvent(String name, {Map<String, Object>? params}) async {
    await _analytics.logEvent(name: name, parameters: params);
  }

  Future<void> logSignUp(String method) async {
    await _analytics.logSignUp(signUpMethod: method);
  }

  Future<void> logLogin(String method) async {
    await _analytics.logLogin(loginMethod: method);
  }

  Future<void> setUserId(String? uid) async {
    await _analytics.setUserId(id: uid);
  }
}
