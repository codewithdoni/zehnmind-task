import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zehnmind/config/di/get_it.dart';
import 'package:zehnmind/config/router/app_router.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/services/language_service.dart';
import 'package:zehnmind/core/services/notification_service.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/core/widgets/language_picker_tile.dart';
import 'package:zehnmind/features/auth/presentation/bloc/onboarding/onboarding_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Step 0 = language picker, then 4 intro/notification steps.
  static const _totalSteps = 5;
  bool get _isLanguageStep => _index == 0;
  bool get _isLast => _index == _totalSteps - 1;

  Future<void> _finish() async {
    await context.read<OnboardingCubit>().complete();
    if (!mounted) return;
    context.go(AppRoute.login);
  }

  Future<void> _allowNotificationsAndFinish() async {
    try {
      final service = getIt<NotificationService>();
      await service.requestPermission();
      await service.scheduleDailyDigest();
    } catch (_) {}
    await _finish();
  }

  void _next() {
    if (_isLast) {
      _allowNotificationsAndFinish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    }
  }

  String _ctaLabel() {
    if (_isLanguageStep) return t.language.kContinue;
    if (_isLast) return t.onboarding.allow_notifications;
    return t.onboarding.next;
  }

  @override
  Widget build(BuildContext context) {
    final introSteps = <_StepData>[
      _StepData(
        icon: Icons.checklist_rounded,
        title: t.onboarding.step1_title,
        description: t.onboarding.step1_desc,
      ),
      _StepData(
        icon: Icons.cloud_sync_rounded,
        title: t.onboarding.step2_title,
        description: t.onboarding.step2_desc,
      ),
      _StepData(
        icon: Icons.rocket_launch_rounded,
        title: t.onboarding.step3_title,
        description: t.onboarding.step3_desc,
      ),
      _StepData(
        icon: Icons.notifications_active_rounded,
        title: t.onboarding.step4_title,
        description: t.onboarding.step4_desc,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(t.onboarding.skip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _totalSteps,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) {
                  if (i == 0) return const _LanguageStep();
                  return _StepView(step: introSteps[i - 1]);
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalSteps,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: i == _index ? 28 : 8,
                  decoration: BoxDecoration(
                    color: i == _index ? AppColors.primary : AppColors.border,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: AppPrimaryButton(label: _ctaLabel(), onPressed: _next),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageStep extends StatefulWidget {
  const _LanguageStep();

  @override
  State<_LanguageStep> createState() => _LanguageStepState();
}

class _LanguageStepState extends State<_LanguageStep> {
  late final LanguageService _service = getIt<LanguageService>();

  @override
  Widget build(BuildContext context) {
    final current = _service.currentLocale;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.1),
            ),
            child: const Icon(
              Icons.language_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t.language.title,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            t.language.subtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          ..._service.availableLocales.map(
            (locale) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: LanguagePickerTile(
                flag: _service.flag(locale),
                label: _service.displayName(locale),
                selected: current == locale,
                onTap: () async {
                  await _service.setLocale(locale);
                  if (mounted) setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepData {
  _StepData({
    required this.icon,
    required this.title,
    required this.description,
  });
  final IconData icon;
  final String title;
  final String description;
}

class _StepView extends StatelessWidget {
  const _StepView({required this.step});
  final _StepData step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.1),
            ),
            child: Icon(step.icon, size: 84, color: AppColors.primary),
          ),
          const SizedBox(height: 32),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            step.description,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
