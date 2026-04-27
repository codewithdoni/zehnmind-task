import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zehnmind/config/router/app_router.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/features/auth/presentation/bloc/onboarding/onboarding_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  late final List<_StepData> _steps = [
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
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isLast => _index == _steps.length - 1;

  Future<void> _finish() async {
    await context.read<OnboardingCubit>().complete();
    if (!mounted) return;
    context.go(AppRoute.login);
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: _steps.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => _StepView(step: _steps[i]),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _steps.length,
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
              child: AppPrimaryButton(
                label: _isLast ? t.onboarding.get_started : t.onboarding.next,
                onPressed: () {
                  if (_isLast) {
                    _finish();
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
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
