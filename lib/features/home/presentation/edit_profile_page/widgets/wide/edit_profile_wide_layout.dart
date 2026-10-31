import 'package:flutter/material.dart';

import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../core/widgets/wide/staggered_entrance.dart';
import 'edit_profile_section_card.dart';

/// Total length of the staggered card entrance.
const Duration _kEntranceDuration = Duration(milliseconds: 900);

/// Fixed width of the avatar/specialization/location column on desktop.
const double _kSideColumnWidth = 340.0;

/// Tablet (one column) / desktop (two columns) arrangement of the Edit
/// Profile form. Pure layout: the page owns every controller, the form key
/// and all callbacks, and hands the ready-built fields in.
class EditProfileWideLayout extends StatefulWidget {
  final Widget avatar;
  final Widget firstName;
  final Widget lastName;
  final Widget age;
  final Widget bio;
  final Widget specialization;
  final Widget location;
  final Widget skills;
  final String locationTitle;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const EditProfileWideLayout({
    super.key,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bio,
    required this.specialization,
    required this.location,
    required this.skills,
    required this.locationTitle,
    required this.onCancel,
    required this.onSave,
  });

  @override
  State<EditProfileWideLayout> createState() => _EditProfileWideLayoutState();
}

class _EditProfileWideLayoutState extends State<EditProfileWideLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
      vsync: this,
      duration: _kEntranceDuration,
    )..forward();
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  Widget _staggered(int index, Widget child) => StaggeredEntrance(
    animation: _entrance,
    index: index,
    child: child,
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final isDesktop = ResponsiveHelper.isDesktop(
      MediaQuery.sizeOf(context).width,
    );

    final avatarCard = EditProfileSectionCard(
      icon: Icons.photo_camera_outlined,
      title: AppLocalizations.of(context)!.edit_profile_photo,
      child: Center(
        child: widget.avatar,
      ),
    );
    final roleCard = EditProfileSectionCard(
      icon: Icons.work_outline,
      title: AppLocalizations.of(context)!.edit_profile_specialization,
      child: widget.specialization,
    );
    final locationCard = EditProfileSectionCard(
      icon: Icons.place_outlined,
      title: widget.locationTitle,
      child: widget.location,
    );
    final personalCard = EditProfileSectionCard(
      icon: Icons.badge_outlined,
      title: AppLocalizations.of(context)!.edit_profile_personal_info,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0,
            children: [
              Expanded(
                child: widget.firstName,
              ),
              Expanded(
                child: widget.lastName,
              ),
            ],
          ),
          widget.age,
        ],
      ),
    );
    final bioCard = EditProfileSectionCard(
      icon: Icons.notes,
      title: AppLocalizations.of(context)!.edit_profile_bio,
      child: widget.bio,
    );
    final skillsCard = EditProfileSectionCard(
      icon: Icons.auto_awesome_outlined,
      title: AppLocalizations.of(context)!.edit_profile_skills,
      child: widget.skills,
    );
    final actions = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 16.0,
      children: [
        CustomTextBtn(
          onPressed: widget.onCancel,
          text: AppLocalizations.of(context)!.common_cancel,
        ),
        ActionBtn(
          onPressed: widget.onSave,
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 28.0,
          ),
          child: Text(
            AppLocalizations.of(context)!.common_save_changes,
            style: textTheme.bold15.copyWith(
              color: AppColors.majorelleBlue.value,
            ),
          ),
        ),
      ],
    );

    const scrollPadding = EdgeInsets.only(
      top: 8.0,
      bottom: 32.0,
    );

    if (isDesktop) {
      return HorizontalPadding(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.0,
          children: [
            SizedBox(
              width: _kSideColumnWidth,
              child: SingleChildScrollView(
                padding: scrollPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20.0,
                  children: [
                    _staggered(0, avatarCard),
                    _staggered(1, roleCard),
                    _staggered(2, locationCard),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: scrollPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20.0,
                  children: [
                    _staggered(1, personalCard),
                    _staggered(2, bioCard),
                    _staggered(3, skillsCard),
                    _staggered(4, actions),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return HorizontalPadding(
      child: SingleChildScrollView(
        padding: scrollPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20.0,
          children: [
            _staggered(0, avatarCard),
            _staggered(1, personalCard),
            _staggered(2, bioCard),
            _staggered(3, roleCard),
            _staggered(4, locationCard),
            _staggered(5, skillsCard),
            _staggered(6, actions),
          ],
        ),
      ),
    );
  }
}
