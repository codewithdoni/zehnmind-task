# Keep SQLite and Sqflite - CRITICAL for database functionality
-keep class org.sqlite.** { *; }
-keep class org.sqlite.database.** { *; }
-keep class com.tekartik.sqflite.** { *; }
-dontwarn org.sqlite.**

# Keep Flutter Local Notifications - CRITICAL for notifications
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-keep class androidx.work.** { *; }
-dontwarn com.dexterous.flutterlocalnotifications.**

# Keep all BroadcastReceivers (needed for notification receivers)
-keep public class * extends android.content.BroadcastReceiver {
    public <init>(...);
}

# Keep notification-related classes
-keep class * extends androidx.core.app.JobIntentService { *; }

# Keep database-related classes
-keep class * extends androidx.sqlite.db.SupportSQLiteOpenHelper { *; }

# Firebase/Google Play Services (you're using these)
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-dontwarn com.google.firebase.**

# Flutter and Dart
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.**

# Gson (if used)
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes InnerClasses
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }

# CRITICAL: Gson TypeAdapter and related interfaces (for flutter_local_notifications)
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Keep fields annotated with @SerializedName
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# Keep Gson TypeToken (critical for generic type resolution)
-keep class com.google.gson.reflect.TypeToken { *; }
-keep class * extends com.google.gson.reflect.TypeToken

# Keep all enums (critical for flutter_local_notifications ScheduleMode)
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep generic signature (needed for some libraries)
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod

# Keep line numbers for better crash reports
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Flutter Timezone
-keep class com.simonlovell.fluttertimezone.** { *; }
-dontwarn com.simonlovell.fluttertimezone.**

# Permission Handler
-keep class com.baseflow.permissionhandler.** { *; }
-dontwarn com.baseflow.permissionhandler.**

# Path Provider (often used implicitly)
-keep class io.flutter.plugins.pathprovider.** { *; }
-dontwarn io.flutter.plugins.pathprovider.**

# Shared Preferences (often used implicitly)
-keep class io.flutter.plugins.sharedpreferences.** { *; }
-dontwarn io.flutter.plugins.sharedpreferences.**