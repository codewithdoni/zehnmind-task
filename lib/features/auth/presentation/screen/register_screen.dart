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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _phoneC = TextEditingController();
  final _passwordC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _phoneC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  String _errorText(AppException error) => switch (error) {
    EmailInUseException() => t.errors.email_in_use,
    WeakPasswordException() => t.errors.weak_password,
    InvalidEmailException() => t.errors.invalid_email,
    NoInternetConnectionException() => t.errors.no_internet,
    _ => error.message ?? t.errors.something_went_wrong,
  };

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.register(
        fullName: _nameC.text.trim(),
        email: _emailC.text.trim(),
        phone: _phoneC.text.trim(),
        password: _passwordC.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status == AuthStatus.error && state.error != null) {
            context.showSnack(_errorText(state.error!));
            context.read<AuthBloc>().add(const AuthEvent.clearError());
          }
          if (state.status == AuthStatus.authenticated) {
            context.go(AppRoute.home);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.auth.register,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t.auth.register_subtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 28),
                AppTextField(
                  controller: _nameC,
                  hint: t.auth.full_name,
                  prefixIcon: const Icon(Icons.person_outline, size: 20),
                  validator: (v) => (v?.trim().isEmpty ?? true) ? '!' : null,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _emailC,
                  hint: t.auth.email,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined, size: 20),
                  validator: (v) {
                    final value = v?.trim() ?? '';
                    if (!value.contains('@')) return '!';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _phoneC,
                  hint: '+998 90 123 45 67',
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d\s+]')),
                  ],
                  prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                  validator: (v) => (v?.trim().isEmpty ?? true) ? '!' : null,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _passwordC,
                  hint: t.auth.password,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline, size: 20),
                  validator: (v) {
                    if ((v?.length ?? 0) < 6) return '!';
                    return null;
                  },
                ),
                const SizedBox(height: 28),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return AppPrimaryButton(
                      label: t.auth.register,
                      isLoading: state.status == AuthStatus.loading,
                      onPressed: _submit,
                    );
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: Wrap(
                    children: [
                      Text(
                        '${t.auth.have_account} ',
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () => context.go(AppRoute.login),
                        child: Text(
                          t.auth.login,
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
}
