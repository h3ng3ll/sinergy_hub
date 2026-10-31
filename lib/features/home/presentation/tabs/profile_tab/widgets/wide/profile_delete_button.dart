import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';

/// Quiet destructive action — deliberately less prominent than the CTA.
class ProfileDeleteButton extends StatelessWidget {
  final VoidCallback onDelete;

  const ProfileDeleteButton({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final red = AppColors.heartRed.value;

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Center(
          child: TextButton.icon(
            onPressed: state.isDeleting ? null : onDelete,
            style: TextButton.styleFrom(
              foregroundColor: red,
              backgroundColor: AppColors.white.value.withValues(
                alpha: 0.85,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 12.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  14.0,
                ),
              ),
            ),
            icon: const Icon(
              Icons.delete_outline,
              size: 20.0,
            ),
            label: Text(
              AppLocalizations.of(context)!.profile_delete_account,
              style: textTheme.medium15.copyWith(
                color: red,
              ),
            ),
          ),
        );
      },
    );
  }
}
