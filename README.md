# Zehnmind Tasks

A production-grade Flutter test project for the **Zehnmind.ai Senior Flutter Developer** position. It is a small, opinionated TODO app powered by Firebase that demonstrates clean architecture, BLoC state management, code generation, dependency injection, internationalization, local notifications, and on-device LLM features.

- **App name:** Zehnmind Tasks
- **Bundle ID** (Android & iOS): `ai.zehnmind.app`
- **Firebase project:** `zehnmind-task-9f2a3`
- **Flutter:** 3.38.10 (pinned via FVM)
- **Dart:** 3.10.x

---

## Table of contents

- [Features](#features)
- [Tech stack](#tech-stack)
- [Architecture](#architecture)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Firebase setup](#firebase-setup)
- [Common commands](#common-commands)
- [State management](#state-management)
- [Routing](#routing)
- [Error handling](#error-handling)
- [Localization](#localization)
- [Theming](#theming)
- [Notifications](#notifications)
- [AI features](#ai-features)
- [Firestore data model](#firestore-data-model)
- [Conventions](#conventions)
- [Testing scenarios](#testing-scenarios)
- [Troubleshooting](#troubleshooting)
- [Out of scope](#out-of-scope)

---

## Features

### Auth

- Email + password registration. The Firebase Auth user and a Firestore profile document are created together; if the Firestore write fails (e.g. rules not yet deployed), the auth session still succeeds and the profile is auto-created on the first profile read.
- Email + password login.
- Phone OTP login with a `pinput` 6-digit field and a 60-second resend timer.
- Google Sign-In. New Google users get an auto-generated Firestore profile.
- Logout (with a confirmation dialog).
- 5-step onboarding: language picker → 3 intro slides → notification permission. Onboarding state is persisted in `SharedPreferences` via `OnboardingCubit`.
- Auth-gated routing: GoRouter `redirect` re-runs whenever `AuthBloc` emits, plus each auth screen has a `BlocListener` that explicitly navigates on `AuthStatus.authenticated` for instant feedback after register/login.

### TODOs

- Realtime Firestore stream (`emit.forEach` from `TodoBloc`).
- Rich task model:
  - `title` (required), `description`
  - `priority` (`low` / `medium` / `high`, color-coded badge)
  - `dueDate` (calendar picker)
  - `categories` (chips: Work, Personal, Urgent, Ideas)
  - `subtasks` (nested checklist)
  - `is_completed`, `created_at`, `updated_at`
- Bottom-sheet form for add and edit (`useRootNavigator: true`, so the sheet sits above the bottom nav).
- `AI Suggest` button calls Gemini to fill priority + categories from the title/description.
- Swipe-to-delete (Dismissible).
- Empty state, loading state, and a counter chip in the app bar.

### Profile

- Avatar from initials, info cards (name, email, phone, joined).
- Edit profile (`/profile/edit`, full-screen via `parentNavigatorKey: rootNavigatorKey`).
- Share contact as a vCard via `share_plus`.
- Export profile as a PDF (`pdf` package + `open_filex`).
- Change app language from a bottom sheet (uz / uz-Cyrl / ru).
- Logout with confirmation.

### Notifications (local only)

- `flutter_local_notifications` + `timezone` + `flutter_timezone` + `permission_handler`.
- A `NotificationService` exposes `scheduleTaskReminder`, `cancelTaskReminder`, `scheduleDailyDigest`, `cancelAll`.
- Each task with a `dueDate` schedules **two** notifications: one at the due time, and one **1 hour before** as a pre-warning. The notification id is derived deterministically from the Firestore doc id, so a re-schedule cleanly replaces the previous one.
- A daily digest fires at **09:00 local time** (`DateTimeComponents.time` for repetition).
- Onboarding's last step requests `Permission.notification` (and best-effort `Permission.scheduleExactAlarm`) before scheduling the digest.
- All scheduling is wrapped in try/catch and logged via the injected `Logger` — a notification failure never breaks a Firestore write.

### AI (Gemini)

- `AiService` uses `google_generative_ai` (no Firebase Vertex SDK because of native-asset hook conflicts with build_runner — see [troubleshooting](#troubleshooting)).
- Two features:
  - **Smart Categorizer** (`AI Suggest` button in the task form): given the title and optional description, returns a JSON object with `priority` and 0-2 `categories` from the allow-list.
  - **Today's Recap** (sparkles button in the home app bar): given the tasks the user completed today, returns a 2-3 sentence uplifting recap.
- The Gemini API key is supplied at run time:
  ```bash
  flutter run --dart-define=GEMINI_API_KEY=AIza...
  ```
  Without a key, the AI features fall back to safe defaults (medium priority, no categories; plain count-based recap).

### Localization

- `slang` 4.x with three locales: **uz** (Uzbek Latin, base), **uz-Cyrl** (Uzbek Cyrillic), **ru** (Russian).
- Source files are `lib/core/i18n/{uz, uz-Cyrl, ru}.i18n.json`. Generated dispatcher in `lib/core/i18n/translations.g.dart` (run `dart run slang`).
- Selected locale persists in `SharedPreferences` via `LanguageService`.
- Language picker appears as the first onboarding step **and** as a bottom sheet trigger on the profile screen. Switching the locale immediately rebuilds the app via slang's reactive `TranslationProvider`.

### Theming

- Material 3, light + dark themes.
- Inter font family (`google_fonts.interTextTheme`).
- Custom palette in `lib/core/theme/app_colors.dart` (indigo primary, teal accent).

---

## Tech stack

| Concern | Package |
|---|---|
| State management | `flutter_bloc` 9.x |
| Code generation | `freezed` 3.x, `json_serializable`, `injectable_generator`, `flutter_gen_runner` |
| Dependency injection | `get_it` 9.x + `injectable` 2.x |
| Routing | `go_router` 17.x |
| Backend | `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_analytics`, `firebase_crashlytics` |
| Auth providers | `google_sign_in` 7.x, Firebase Phone OTP |
| Local notifications | `flutter_local_notifications` 19.x, `timezone`, `flutter_timezone`, `permission_handler` |
| AI | `google_generative_ai` 0.4.x (Gemini 2.5 Flash) |
| i18n | `slang` 4.x, `slang_flutter` |
| Sharing & PDF | `share_plus`, `pdf`, `open_filex`, `path_provider` |
| Utility | `pinput`, `flutter_animate`, `flutter_native_splash`, `flutter_svg`, `equatable`, `intl`, `logger`, `package_info_plus`, `shared_preferences` |

---

## Architecture

Clean Architecture with three layers per feature:

```
data/         # Concrete I/O
  data_source/   # Firestore wrappers (@lazySingleton)
  repository/    # Concrete repository (@Injectable(as: BaseFooRepository))
domain/       # Pure Dart contracts
  entity/        # @freezed entities (TodoItem, UserProfile)
  repository/    # Abstract interfaces (BaseFooRepository)
presentation/ # UI + state
  bloc/          # @injectable Blocs/Cubits with freezed events/states
  screen/        # Routed screens
  widget/        # Feature-local widgets
```

**Why this shape?**

- Domain is the only thing presentation talks to → the same Bloc could be wired to a different data source (e.g. a mock for tests, a different backend).
- Errors normalize through `core/error/app_exception.dart` → presentation never deals with `FirebaseException` or `DioException` directly.
- DI lets us replace Firebase singletons in tests without rewriting consumers.

**Key cross-cutting helpers** in `lib/core/`:

- `error/app_exception.dart` — sealed `AppException` hierarchy with `AppException.from(error)` that maps `FirebaseAuthException`/`FirebaseException` to typed exceptions (`InvalidCredentialsException`, `UnauthorizedException`, `NoInternetConnectionException`, etc.).
- `safe_execution/safe_execution_manager.dart` — `SafeExecutionManager.run<T>(fn)` wraps a `Future<T>`, logs failures, and rethrows them as `AppException`. Repositories call it for every Firestore operation.
- `services/notification_service.dart`, `ai_service.dart`, `analytics_service.dart`, `language_service.dart` — singletons exposed via DI.
- `theme/`, `widgets/`, `extensions/`, `i18n/` — reusable UI bits.

---

## Project structure

```
lib/
├── main.dart                          # void main() => bootstrap();
├── app.dart                           # ZehnmindApp + bootstrap() (Firebase, Crashlytics, DI, slang)
├── firebase_options.dart              # generated by `flutterfire configure`
│
├── config/
│   ├── di/
│   │   ├── get_it.dart                # @InjectableInit() configureDependencies()
│   │   ├── get_it.config.dart         # generated
│   │   └── module/
│   │       ├── firebase_module.dart   # @module: FirebaseAuth, FirebaseFirestore, GoogleSignIn, FirebaseAnalytics, FirebaseCrashlytics
│   │       ├── shared_pref_module.dart# @preResolve SharedPreferences
│   │       └── logger_module.dart     # PrettyPrinter Logger
│   └── router/
│       └── app_router.dart            # GoRouter + AppRoute path constants
│
├── core/
│   ├── error/                         # AppException + handlers
│   ├── safe_execution/                # SafeExecutionManager
│   ├── i18n/                          # slang sources + generated
│   ├── theme/                         # AppColors, AppTheme.light/dark
│   ├── widgets/                       # AppPrimaryButton, AppOutlinedButton, AppTextField, LanguagePickerTile
│   ├── extensions/                    # ContextExtensions
│   └── services/                      # NotificationService, AiService, AnalyticsService, LanguageService
│
└── features/
    ├── auth/
    │   ├── data/data_source/auth_firebase_source.dart
    │   ├── data/repository/auth_repository.dart
    │   ├── domain/repository/base_auth_repository.dart
    │   ├── domain/exceptions/         # (placeholder)
    │   └── presentation/
    │       ├── bloc/auth/             # AuthBloc + AuthEvent + AuthState (freezed)
    │       ├── bloc/onboarding/onboarding_cubit.dart
    │       ├── screen/onboarding_screen.dart   # 5-step (lang + 3 intro + notifications)
    │       ├── screen/login_screen.dart        # 2 tabs: email | phone
    │       ├── screen/register_screen.dart
    │       ├── screen/otp_screen.dart
    │       └── widget/                # SocialLoginButton, etc.
    │
    ├── home/
    │   ├── data/data_source/todo_firestore_source.dart
    │   ├── data/repository/todo_repository.dart   # schedules notifications
    │   ├── domain/entity/todo_item.dart           # freezed: TodoItem + Subtask + TodoPriority
    │   ├── domain/repository/base_todo_repository.dart
    │   └── presentation/
    │       ├── bloc/todo_bloc.dart    # + todo_event.dart + todo_state.dart
    │       ├── screen/main_shell.dart # ShellRoute scaffold (NavigationBar)
    │       ├── screen/home_screen.dart# AppBar AI Recap button + counter chip + FAB
    │       └── widget/todo_form_sheet.dart, todo_list_tile.dart
    │
    └── profile/
        ├── data/data_source/profile_firestore_source.dart
        ├── data/repository/profile_repository.dart
        ├── domain/entity/user_profile.dart        # freezed
        ├── domain/repository/base_profile_repository.dart
        └── presentation/
            ├── bloc/profile_bloc.dart
            ├── screen/profile_screen.dart         # avatar + info + share + PDF + language + logout
            ├── screen/edit_profile_screen.dart    # full-screen, root navigator
            └── widget/profile_info_card.dart
```

Tests live under `test/` (none yet — see [out of scope](#out-of-scope)).

---

## Getting started

This project is pinned to Flutter 3.38.10 via [FVM](https://fvm.app/). The repo includes:
- `.fvmrc` (`{ "flutter": "3.38.10" }`)
- `.fvm/flutter_sdk` symlink → `~/fvm/versions/3.38.10`
- `android/local.properties` `flutter.sdk` set to the FVM path
- `.vscode/settings.json` `dart.flutterSdkPath` → `.fvm/flutter_sdk`

Use **`fvm flutter ...`** for every command unless your `flutter` already resolves to FVM 3.38.10.

```bash
# 0. Install FVM and the pinned SDK (one-time)
brew tap leoafarias/fvm
brew install fvm
fvm install 3.38.10

# 1. Install dependencies
fvm flutter pub get

# 2. Generate slang translations
fvm dart run slang

# 3. Generate freezed / injectable / json_serializable / flutter_gen
fvm dart run build_runner build --delete-conflicting-outputs

# 4. iOS only
cd ios && pod install && cd ..

# 5. Run (with Gemini AI)
fvm flutter run --dart-define=GEMINI_API_KEY=AIza...

# Or without AI (Smart Categorizer / Recap return safe fallbacks)
fvm flutter run
```

---

## Firebase setup

The project ships pre-configured for `zehnmind-task-9f2a3`. The relevant generated files are:

- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `firebase.json` (FlutterFire CLI manifest)
- `firestore.rules`

If you want to point at your own Firebase project, regenerate them:

```bash
dart pub global activate flutterfire_cli
flutterfire configure \
  --project=<your-project-id> \
  --platforms=android,ios \
  --android-package-name=ai.zehnmind.app \
  --ios-bundle-id=ai.zehnmind.app \
  --yes
```

In the Firebase Console for your project, **enable**:

1. **Authentication → Sign-in method:** Email/Password, Phone, Google.
2. **Authentication → Settings → SMS region policy:** allowlist `+998` (or whichever country code you test phone OTP from). This is required since November 2024 for new Firebase projects.
3. **Firestore Database:** Native mode.
4. **Crashlytics** and **Analytics**.

Deploy the security rules:

```bash
firebase deploy --only firestore:rules --project <your-project-id>
```

For **Google Sign-In on Android**, add your debug SHA-1 fingerprint:

```bash
cd android && ./gradlew signingReport
# Copy the debug variant SHA-1 → Firebase Console → Project Settings → Your apps → Add fingerprint
```

For **Phone OTP on iOS**, upload an APNs auth key under Project Settings → Cloud Messaging.

For **testing phone OTP without real SMS**, add a test number under Authentication → Sign-in method → Phone → "Phone numbers for testing" (e.g. `+998901234567` with verification code `123456`).

---

## Common commands

```bash
# Code generation
fvm dart run slang
fvm dart run build_runner build --delete-conflicting-outputs
fvm dart run build_runner watch --delete-conflicting-outputs   # during development

# Static analysis & format
fvm flutter analyze
fvm dart format .

# Run debug
fvm flutter run --dart-define=GEMINI_API_KEY=...

# Build release artifacts
fvm flutter build apk --release
fvm flutter build appbundle --release
fvm flutter build ios --release

# iOS pod refresh
cd ios && rm -rf Pods Podfile.lock && pod install && cd ..

# Firestore rules
firebase deploy --only firestore:rules --project zehnmind-task-9f2a3
```

---

## State management

- Each feature owns one or more **Blocs / Cubits** annotated `@injectable`.
- Events and states are **freezed sealed classes**:
  ```dart
  @freezed
  sealed class AuthEvent with _$AuthEvent {
    const factory AuthEvent.checkAuth() = AuthEventCheckAuth;
    const factory AuthEvent.loginWithEmail({
      required String email,
      required String password,
    }) = AuthEventLoginWithEmail;
    // ...
  }
  ```
- A **status enum** + **typed `error` field** in state is the shape used everywhere (`AuthStatus`, `TodoStatus`, `ProfileStatus`).
- The router and screens read state via `BlocBuilder` / `BlocListener`. Navigation on side effects (success, OTP sent, etc.) is done in `BlocListener` rather than from Bloc — keeps Bloc free of `BuildContext`.

**Global Blocs** (provided once at the app root in `app.dart`):
- `AuthBloc` (drives router redirects and global auth state)
- `OnboardingCubit` (boolean: onboarding complete?)

**Route-scoped Blocs** (created per route via `BlocProvider(create: (_) => getIt<...>()..add(...))`):
- `TodoBloc`, `ProfileBloc`

---

## Routing

`go_router` 17 with `ShellRoute` for the bottom navigation. All path constants live in `AppRoute`:

```dart
class AppRoute {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const otp = '/otp';
  static const home = '/home';
  static const profile = '/profile';
  static const editProfile = '/profile/edit';
}
```

The `redirect` callback gates auth:

- `AuthStatus.initial` → keep on `/` (splash) until `checkAuth` resolves.
- Not authenticated → if onboarding completed, send to `/login`, else `/onboarding`.
- Authenticated **and** on an auth route → send to `/home`.

`GoRouterRefreshStream(authBloc.stream)` makes the router re-run `redirect` on every auth state change. Each auth screen also has a `BlocListener` that calls `context.go(AppRoute.home)` when state becomes `authenticated` — this gives instant navigation even if the router refresh is debounced.

`/profile/edit` uses `parentNavigatorKey: rootNavigatorKey` so it covers the bottom navigation bar.

---

## Error handling

```
Firestore / FirebaseAuth call
        │
        ▼
SafeExecutionManager.run<T>()
   • catches anything
   • maps via AppException.from(error)
   • logs (Logger.e + stack)
   • throws the typed AppException
        │
        ▼
Bloc try/catch on AppException
   • emit(state.copyWith(status: error, error: appException))
        │
        ▼
Screen BlocListener
   • renders user-facing message via switch on AppException subtype
   • dispatches AuthEvent.clearError() to reset
```

The base `AppException` is a `sealed` class. Adding a new typed error means adding a subclass and one case in `AppException.from`.

---

## Localization

- `slang.yaml` configures `base_locale: uz`, `fallback_strategy: base_locale`.
- Add a new key by editing **all three** JSONs (or rely on fallback) and running `fvm dart run slang`.
- Use translations as `t.section.key`; pluralization and parameters are supported (e.g. `t.home.completed_count.replaceAll('{done}', ...)` for our simple placeholders).
- Reserved Dart keywords like `continue` are emitted with a `k` prefix → `t.language.kContinue`.

`LanguageService` exposes `availableLocales`, `displayName(locale)`, and `flag(locale)` so the language picker (in onboarding step 0 and the profile bottom sheet) is data-driven.

---

## Theming

- `AppTheme.light()` and `AppTheme.dark()` configure Material 3 with our palette, Inter typography, and consistent input/button shapes.
- The `MaterialApp.router`'s `themeMode: ThemeMode.system` follows the device.
- Custom colors live in `AppColors` (single source of truth).

---

## Notifications

`lib/core/services/notification_service.dart`:

```dart
final svc = getIt<NotificationService>();

await svc.requestPermission();   // iOS UNUserNotificationCenter + Android POST_NOTIFICATIONS

await svc.scheduleTaskReminder(  // creates 2 notifications: due time + 1h before
  taskId: docId,
  title: title,
  dueDate: dueDate,
);

await svc.cancelTaskReminder(taskId);

await svc.scheduleDailyDigest(hour: 9, minute: 0); // repeats daily
```

Wired up automatically inside `TodoRepository`:

| Repo method | Notification action |
|---|---|
| `addTodo` (with dueDate) | schedule both reminders |
| `updateTodo` | cancel old, reschedule if dueDate present and not completed |
| `toggle(isCompleted: true)` | cancel reminder |
| `deleteTodo` | cancel reminder |

The daily digest is scheduled once at the end of onboarding (the "Allow notifications" step).

Native config:

- **Android** (`android/app/src/main/AndroidManifest.xml`): `POST_NOTIFICATIONS`, `SCHEDULE_EXACT_ALARM`, `USE_EXACT_ALARM`, `RECEIVE_BOOT_COMPLETED` permissions; `ScheduledNotificationReceiver` and `ScheduledNotificationBootReceiver` from `flutter_local_notifications`. The Gradle file enables core library desugaring (`coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")`) which is required by the plugin.
- **iOS** (`ios/Runner/AppDelegate.swift`, `Info.plist`): `UNUserNotificationCenter.current().delegate = self`, `application.registerForRemoteNotifications()`, and `UIBackgroundModes` = `[fetch, remote-notification]`.

---

## AI features

Gemini calls go through `lib/core/services/ai_service.dart`. The API key is supplied at compile time:

```bash
flutter run --dart-define=GEMINI_API_KEY=AIza...
```

`AiService.isConfigured` reflects whether the key is present; when `false` both AI methods return safe deterministic fallbacks (medium priority, count-based recap), so the UI works without an API key.

**Smart Categorizer**:

```dart
final suggestion = await getIt<AiService>().categorize(
  title: 'Submit Q4 budget',
  description: 'Send to finance by Friday',
);
// → TodoPriority.high, ['Work', 'Urgent']
```

The prompt locks the model to a JSON object with a strict allow-list of categories.

**Today's Recap**:

```dart
final recap = await getIt<AiService>().summarize(completedToday);
// → "Strong Tuesday — you knocked out three tasks including the Q4 budget submission. Take a breather and tee up tomorrow."
```

Tapping the sparkles icon in the home app bar opens a dialog that shows the recap.

---

## Firestore data model

```
users/{uid}
  ├── full_name : string
  ├── email     : string
  ├── phone     : string
  ├── created_at: timestamp
  └── todos/{todoId}
      ├── title       : string
      ├── description : string
      ├── is_completed: bool
      ├── priority    : "low" | "medium" | "high"
      ├── due_date    : timestamp | null
      ├── categories  : array<string>
      ├── subtasks    : array<{ id: string, title: string, is_completed: bool }>
      ├── created_at  : timestamp
      └── updated_at  : timestamp
```

Rules (`firestore.rules`):

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;

      match /todos/{todoId} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
    }
  }
}
```

Each authenticated user can only touch their own subtree.

---

## Conventions

| Pattern | Example |
|---|---|
| Abstract repository in `domain/` | `BaseAuthRepository`, `BaseTodoRepository`, `BaseProfileRepository` |
| Concrete in `data/` | `@LazySingleton(as: BaseAuthRepository) class AuthRepository` |
| Firestore wrappers | `@lazySingleton class TodoFirestoreSource` |
| Bloc | `@injectable class AuthBloc extends Bloc<AuthEvent, AuthState>` |
| Events / states | freezed `sealed` unions, status enum + typed `error` field |
| Screens | `class FooScreen extends StatelessWidget` (or Stateful when needed); BLoC injected via `BlocProvider(create: getIt<...>())` in router |
| Widgets | colocated under `presentation/widget/` |
| File names | `snake_case.dart` |
| Class names | `PascalCase`, repository `XxxRepository`, abstract `BaseXxxRepository` |

Generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) are excluded from analysis; commit them or regenerate before review.

---

## Testing scenarios

A manual smoke test:

1. **Onboarding (first launch)**
   - Step 0 (language picker): switch between uz / uz-Cyrl / ru — UI re-renders immediately.
   - Pages 1-3: intro slides.
   - Page 4: tap **Allow notifications** → permission granted → daily digest scheduled at 09:00 → routed to `/login`.
2. **Register**: fill the form → tap Register → routed straight to `/home` (no manual login).
3. **Login (email)**: email + password → `/home`.
4. **Login (phone)**: phone tab → enter `+998…` → OTP screen → enter 6 digits → `/home`.
5. **Google Sign-In**: tap → account chooser → `/home`. New users get a Firestore profile auto-created.
6. **TODO CRUD**:
   - Add a task with title "Test", priority High, due date 2 minutes in the future, category Work, two subtasks.
   - List tile shows priority side bar (red), due chip, subtasks counter "0/2", "Work" chip.
   - Wait 2 minutes → OS notification fires.
   - Edit the task: clear the due date → previously scheduled notification is cancelled.
   - Tap the checkbox → strikethrough; the reminder is cancelled.
   - Swipe left → delete; reminder cancelled (no-op if already cancelled).
7. **AI Suggest**: in the form, type "Send Q4 report to finance" → AI Suggest → priority becomes High and "Work"/"Urgent" categories light up.
8. **Today's Recap**: complete a couple of tasks → tap the sparkles icon in the app bar → dialog shows a Gemini-generated recap (or a fallback if no API key).
9. **Profile**:
   - Confirms data is visible (auto-created if missing).
   - Edit → save → reflected immediately.
   - Share → vCard sheet from the OS.
   - Export PDF → opens via `open_filex`.
   - Change language → bottom sheet → tap a language → app re-renders.
   - Logout → confirmation → `/login`.

---

## Troubleshooting

### `flutter build apk` fails with `ui.SemanticsHitTestBehavior` not found

Symptom: errors reference `~/Development/flutter/packages/flutter/...`.

Cause: an older Flutter SDK at `~/Development/flutter` is being used as the framework even though `which flutter` resolves to FVM. This happens when `.dart_tool/package_config.json` was generated by a `pub get` that used the wrong `FLUTTER_ROOT`.

Fix:

```bash
rm -rf .dart_tool
fvm flutter pub get
fvm flutter build apk
```

The shipped `android/local.properties` and `.vscode/settings.json` already pin Flutter to the FVM path; just make sure your IDE/CLI uses **`fvm flutter`**.

### `dart compile' does not support build hooks` from `dart run build_runner`

Cause: a transitive package (e.g. `path_provider_foundation 2.5.x` → `objective_c 9.x`) ships native asset hooks that `dart compile` rejects.

Fix: re-add the dependency overrides:

```yaml
dependency_overrides:
  objective_c: 8.1.0
  path_provider_foundation: 2.4.1
```

then `fvm flutter pub get`.

### Phone OTP error: `SMS unable to be sent until this region enabled by the app developer`

Cause: Firebase project does not have your country code allowlisted for SMS.

Fix: Firebase Console → Authentication → Settings → SMS region policy → add `+998` (or whichever code) to **Allow regions** → Save.

### `flutter doctor` shows the wrong SDK

`fvm flutter doctor` is the source of truth. If `flutter doctor` (without `fvm`) shows a different version, your shell is pointing at a different Flutter — alias it:

```bash
alias flutter='fvm flutter'   # add to ~/.zshrc
```

### Google Sign-In on Android returns immediately with cancellation

You probably haven't added the debug SHA-1 to Firebase Console. Run `cd android && ./gradlew signingReport`, copy the SHA-1 of the debug variant, and paste it into Firebase Console → Project Settings → Your apps → Add fingerprint → re-download `google-services.json`.

### Notifications don't fire on Android 14+

You may need the user to manually grant the "Alarms & reminders" permission. The repo declares `USE_EXACT_ALARM` and `SCHEDULE_EXACT_ALARM`. If exact alarms aren't allowed for your app category by Play, switch to `AndroidScheduleMode.inexactAllowWhileIdle` in `notification_service.dart`.

---

## Out of scope

These were intentionally not implemented to keep the demo focused:

- Unit / widget / integration tests (the architecture is testable; tests will be added in a follow-up).
- Firebase Cloud Messaging (push notifications). Local notifications cover the in-app reminder flow.
- Apple Sign-In. Trivial to add (`sign_in_with_apple`) but Google + email already cover the demo's auth surface.
- CI/CD (Codemagic/GitHub Actions).
- Shorebird OTA.
- Offline cache beyond what Firestore offline persistence already provides.
- Custom dark-mode tokens — the app uses a sensible Material 3 dark default.
