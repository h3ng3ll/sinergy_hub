import 'package:flutter/material.dart';

import '../../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import 'profile_about_section.dart';
import 'profile_delete_button.dart';
import 'profile_identity_card.dart';
import 'profile_looking_for_section.dart';
import 'profile_premium_section.dart';
import 'staggered_entrance.dart';

/// Total length of the staggered card entrance.
const Duration _kEntranceDuration = Duration(milliseconds: 900);

/// Fixed width of the identity column in the two-column (desktop) layout.
const double _kSideColumnWidth = 340.0;

/// Profile layout for tablet (one column) and desktop (two columns).
class ProfileWideBody extends StatefulWidget {
  final UserData userData;
  final VoidCallback onTapAvatar;
  final VoidCallback onTapEditAbout;
  final VoidCallback onTapEditExperience;
  final VoidCallback onTapEditLookingFor;
  final VoidCallback onUpgrade;
  final VoidCallback onManageSubscription;
  final VoidCallback onDelete;

  const ProfileWideBody({
    super.key,
    required this.userData,
    required this.onTapAvatar,
    required this.onTapEditAbout,
    required this.onTapEditExperience,
    required this.onTapEditLookingFor,
    required this.onUpgrade,
    required this.onManageSubscription,
    required this.onDelete,
  });

  @override
  State<ProfileWideBody> createState() => _ProfileWideBodyState();
}

class _ProfileWideBodyState extends State<ProfileWideBody>
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
    final isDesktop = ResponsiveHelper.isDesktop(
      MediaQuery.sizeOf(context).width,
    );

    final identity = ProfileIdentityCard(
      userData: widget.userData,
      onTapAvatar: widget.onTapAvatar,
    );
    final about = ProfileAboutSection(
      userData: widget.userData,
      onTapEdit: widget.onTapEditAbout,
      onTapEditExperience: widget.onTapEditExperience,
    );
    final lookingFor = ProfileLookingForSection(
      userData: widget.userData,
      onTapEdit: widget.onTapEditLookingFor,
    );
    final premium = ProfilePremiumSection(
      onUpgrade: widget.onUpgrade,
      onManage: widget.onManageSubscription,
    );
    final delete = ProfileDeleteButton(
      onDelete: widget.onDelete,
    );

    return BuildAnimatedBackground(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: HorizontalPadding(
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24.0,
                  children: [
                    SizedBox(
                      width: _kSideColumnWidth,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 32.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 20.0,
                          children: [
                            _staggered(0, identity),
                            _staggered(1, premium),
                            _staggered(2, delete),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 32.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 20.0,
                          children: [
                            _staggered(1, about),
                            _staggered(2, lookingFor),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 32.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20.0,
                    children: [
                      _staggered(0, identity),
                      _staggered(1, about),
                      _staggered(2, lookingFor),
                      _staggered(3, premium),
                      _staggered(4, delete),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
