import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/features/auth/presentation/bloc/auth/auth_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  final String verificationId;
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  Timer? _timer;
  int _seconds = 60;
  String _verificationId = '';

  @override
  void initState() {
    super.initState();
    _verificationId = widget.verificationId;
    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _seconds = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds <= 0) {
        timer.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  String _errorText(AppException error) => switch (error) {
    InvalidOtpException() => t.errors.invalid_otp,
    NoInternetConnectionException() => t.errors.no_internet,
    _ => error.message ?? t.errors.something_went_wrong,
  };

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 56,
      textStyle: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary, width: 1.5),
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status == AuthStatus.error && state.error != null) {
            context.showSnack(_errorText(state.error!));
            context.read<AuthBloc>().add(const AuthEvent.clearError());
          }
          if (state.status == AuthStatus.otpSent &&
              state.verificationId != null) {
            _verificationId = state.verificationId!;
            _startTimer();
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.auth.otp_title,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t.auth.otp_subtitle.replaceAll('{phone}', widget.phoneNumber),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Pinput(
                  controller: _otpController,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  onCompleted: (code) => _verify(context, code),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: _seconds > 0
                      ? null
                      : () => context.read<AuthBloc>().add(
                          AuthEvent.sendOtp(widget.phoneNumber),
                        ),
                  child: Text(
                    _seconds > 0
                        ? t.auth.resend_in.replaceAll(
                            '{seconds}',
                            _seconds.toString(),
                          )
                        : t.auth.resend_now,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return AppPrimaryButton(
                    label: t.auth.verify,
                    isLoading: state.status == AuthStatus.loading,
                    onPressed: () => _verify(context, _otpController.text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verify(BuildContext context, String code) {
    if (code.length < 6) return;
    context.read<AuthBloc>().add(
      AuthEvent.verifyOtp(verificationId: _verificationId, code: code),
    );
  }
}
