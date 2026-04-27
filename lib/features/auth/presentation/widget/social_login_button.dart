import 'package:flutter/material.dart';
import 'package:zehnmind/core/theme/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.iconAsset,
    required this.onPressed,
  });

  final String label;
  final String iconAsset;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(iconAsset, height: 20, width: 20),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        side: const BorderSide(color: AppColors.border),
        foregroundColor: AppColors.textPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
