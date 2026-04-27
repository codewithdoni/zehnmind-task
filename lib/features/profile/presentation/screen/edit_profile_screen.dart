import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/core/widgets/app_text_field.dart';
import 'package:zehnmind/features/profile/presentation/bloc/profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameC = TextEditingController();
  final _phoneC = TextEditingController();
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    final profile = context.read<ProfileBloc>().state.profile;
    if (profile != null) {
      _nameC.text = profile.fullName;
      _phoneC.text = profile.phone;
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _phoneC.dispose();
    super.dispose();
  }

  void _save(BuildContext context) {
    final state = context.read<ProfileBloc>().state;
    final current = state.profile;
    if (current == null) return;
    final updated = current.copyWith(
      fullName: _nameC.text.trim(),
      phone: _phoneC.text.trim(),
    );
    context.read<ProfileBloc>().add(ProfileEvent.update(updated));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.profile.edit_title)),
      body: BlocListener<ProfileBloc, ProfileState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status == ProfileStatus.success && _initialized) {
            Navigator.of(context).maybePop();
          }
          if (state.status == ProfileStatus.error && state.error != null) {
            context.showSnack(
              state.error!.message ?? t.errors.something_went_wrong,
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: _nameC,
                hint: t.profile.name,
                prefixIcon: const Icon(Icons.person_outline, size: 20),
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _phoneC,
                hint: t.profile.phone,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d\s+]')),
                ],
                prefixIcon: const Icon(Icons.phone_outlined, size: 20),
              ),
              const SizedBox(height: 24),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return AppPrimaryButton(
                    label: t.profile.save_changes,
                    isLoading: state.status == ProfileStatus.saving,
                    onPressed: () => _save(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
