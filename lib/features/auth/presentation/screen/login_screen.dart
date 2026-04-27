import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zehnmind/config/router/app_router.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/core/widgets/app_text_field.dart';
import 'package:zehnmind/features/auth/presentation/bloc/auth/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();
  final _phoneC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    _emailC.dispose();
    _passwordC.dispose();
    _phoneC.dispose();
    super.dispose();
  }

  String _errorText(AppException error) => switch (error) {
    InvalidCredentialsException() => t.errors.invalid_credentials,
    InvalidEmailException() => t.errors.invalid_email,
    WeakPasswordException() => t.errors.weak_password,
    InvalidOtpException() => t.errors.invalid_otp,
    NoInternetConnectionException() => t.errors.no_internet,
    GoogleSignInCancelledException() => t.errors.google_sign_in_failed,
    _ => error.message ?? t.errors.something_went_wrong,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (p, c) => p.status != c.status,
          listener: (context, state) {
            if (state.status == AuthStatus.error && state.error != null) {
              context.showSnack(_errorText(state.error!));
              context.read<AuthBloc>().add(const AuthEvent.clearError());
            }
            if (state.status == AuthStatus.otpSent) {
              context.push(
                AppRoute.otp,
                extra: {
                  'verificationId': state.verificationId,
                  'phoneNumber': state.phoneNumber,
                },
              );
            }
            if (state.status == AuthStatus.authenticated) {
              context.go(AppRoute.home);
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.auth.login,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t.auth.login_subtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tab,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    indicatorPadding: const EdgeInsets.all(4),
                    labelColor: AppColors.textPrimary,
                    unselectedLabelColor: AppColors.textSecondary,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: t.auth.by_email),
                      Tab(text: t.auth.by_phone),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedSize(
                  duration: const Duration(milliseconds: 220),
                  child: SizedBox(
                    height: _tab.index == 0 ? 240 : 130,
                    child: TabBarView(
                      controller: _tab,
                      children: [
                        _buildEmailForm(context),
                        _buildPhoneForm(context),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final loading = state.status == AuthStatus.loading;
                    return AppPrimaryButton(
                      label: _tab.index == 0 ? t.auth.login : t.auth.send_code,
                      isLoading: loading,
                      onPressed: () => _submit(context),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _OrDivider(label: t.auth.or_continue_with),
                const SizedBox(height: 16),
                AppOutlinedButton(
                  label: t.auth.google,
                  icon: Image.asset(
                    'assets/images/social_logos/google_logo.png',
                    height: 20,
                    width: 20,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.g_mobiledata, size: 28),
                  ),
                  onPressed: () => context.read<AuthBloc>().add(
                    const AuthEvent.signInWithGoogle(),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Wrap(
                    children: [
                      Text(
                        '${t.auth.no_account} ',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () => context.push(AppRoute.register),
                        child: Text(
                          t.auth.register,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: _emailC,
          hint: t.auth.email,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          prefixIcon: const Icon(Icons.email_outlined, size: 20),
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: _passwordC,
          hint: t.auth.password,
          obscureText: true,
          autofillHints: const [AutofillHints.password],
          prefixIcon: const Icon(Icons.lock_outline, size: 20),
        ),
      ],
    );
  }

  Widget _buildPhoneForm(BuildContext context) {
    return AppTextField(
      controller: _phoneC,
      hint: '+998 90 123 45 67',
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\d\s+]'))],
      autofillHints: const [AutofillHints.telephoneNumber],
      prefixIcon: const Icon(Icons.phone_outlined, size: 20),
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    if (_tab.index == 0) {
      bloc.add(
        AuthEvent.loginWithEmail(
          email: _emailC.text.trim(),
          password: _passwordC.text,
        ),
      );
    } else {
      final phone = _phoneC.text.replaceAll(' ', '').trim();
      if (phone.isEmpty) return;
      bloc.add(AuthEvent.sendOtp(phone));
    }
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.divider)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.divider)),
      ],
    );
  }
}
