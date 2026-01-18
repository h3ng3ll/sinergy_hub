import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import 'widgets/build_about.dart';
import 'widgets/build_looking_for/build_looking_for.dart';
import 'widgets/build_profile_header.dart';
import 'widgets/build_skills_n_expertise/build_skills_n_expertise.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  void onTapEditAbout(BuildContext context) {
    EditProfilePageRoute().push(
      context,
    );
  }

  void onTapEditLookingFor(BuildContext context) {}

  void onTapEditSkills(BuildContext context) {}

  void onTapAvatar() {
    EditProfilePageRoute().push(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final userData = state.userData!;
        return BuildAnimatedBackground(
          child: Scaffold(
            appBar: CustomAppBar(),
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                BuildProfileHeader(
                  onTapAvatar: onTapAvatar,
                  userData: userData,
                ),
                Expanded(
                  child: Container(
                    color: AppColors.white.value,
                    child: HorizontalPadding(
                      child: ListView(
                        children: [
                          Gap(20.0),
                          BuildAbout(
                            userData: userData,
                            onTapEdit: () => onTapEditAbout(
                              context,
                            ),
                          ),
                          Gap(20.0),
                          BuildLookingFor(
                            onTapEdit: () => onTapEditLookingFor(
                              context,
                            ),
                            userData: userData,
                          ),
                          Gap(20.0),
                          BuildSkillsNExpertise(
                            onTapEdit: () => onTapEditSkills(
                              context,
                            ),
                          ),
                          Gap(20.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
