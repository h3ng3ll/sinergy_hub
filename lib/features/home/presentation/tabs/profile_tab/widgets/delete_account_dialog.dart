import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

/// Confirmation dialog shown before deleting the current user's account.
///
/// Pops with `true` when the user confirms deletion, `false` (or `null`)
/// otherwise.
class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete account',
              style: textTheme.bold16.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'This will permanently delete your account. '
              'This action cannot be undone.',
              style: textTheme.regular12.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Cancel',
                    style: textTheme.regular12.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Delete',
                    style: textTheme.bold16.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Shows the delete-account confirmation dialog.
  ///
  /// Resolves to `true` only when the user explicitly confirms.
  static Future<bool> show(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const DeleteAccountDialog(),
    );
    return confirmed ?? false;
  }
}
