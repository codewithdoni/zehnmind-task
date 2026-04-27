import UIKit
import Flutter
import flutter_local_notifications
import BackgroundTasks
import AVFoundation
import Firebase
import FirebaseMessaging


@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
          GeneratedPluginRegistrant.register(with: registry)
      }

         // Register background tasks
    BGTaskScheduler.shared.register(forTaskWithIdentifier: "app.rulda.refresh", using: nil) { task in
      self.handleAppRefresh(task: task as! BGAppRefreshTask)
    }

      if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }
      application.registerForRemoteNotifications()

      GeneratedPluginRegistrant.register(with: self)

      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
      super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }

  func handleAppRefresh(task: BGAppRefreshTask) {
      task.setTaskCompleted(success: true)
  }
}

