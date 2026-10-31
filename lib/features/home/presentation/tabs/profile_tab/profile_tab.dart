import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../subscription/presentation/bloc/premium_bloc/premium_bloc.dart';
import '../../../../subscription/presentation/dialogs/paywall_modal_sheet/paywall_modal_sheet.dart';
import '../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'widgets/build_about.dart';
import 'widgets/build_looking_for/build_looking_for.dart';
import 'widgets/build_profile_header.dart';
import 'widgets/build_skills_n_expertise/build_skills_n_expertise.dart';
import 'widgets/delete_account_dialog.dart';
import 'widgets/premium_status_card.dart';
import 'widgets/wide/profile_wide_body.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  void onTapEditAbout() {
    EditProfilePageRoute().push(
      context,
    );
  }

  void onTapEditLookingFor() {
    EditLookingForRoute().push(
      context,
    );
  }

  void onTapEditExperience() {
    EditExperienceRoute().push(
      context,
    );
  }

  void onTapEditSkills() {}

  void onTapAvatar() {
    EditProfilePageRoute().push(
      context,
    );
  }

  Future<void> _onUpgrade() async {
    await PaywallModalSheet.show(context);
  }

  void _onManageSubscription(BuildContext context) {
    context.read<ProfileBloc>().add(
      const ProfileEvent.manageSubscription(),
    );
  }

  Future<void> _openSubscriptionManagement(Uri url) async {
    final opened = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
    if (!opened) {
      await UiMessageService.showError(
        "Couldn't open subscription settings. Manage it in your store account.",
      );
    }
  }

  Future<void> _onDeletePressed(BuildContext context) async {
    final confirmed = await DeleteAccountDialog.show(context);
    if (confirmed && context.mounted) {
      context.read<ProfileBloc>().add(
        const ProfileEvent.deleteAccount(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => getIt<ProfileBloc>(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.isDeleted) {
            UiMessageService.showSuccess('Account deleted');
          } else if (state.isDeleteFailed || state.isSubscriptionUrlFailed) {
            UiMessageService.showError(state.errorMessage);
          } else if (state.isSubscriptionUrlReady) {
            final url = state.subscriptionManagementUrl;
            if (url != null) _openSubscriptionManagement(url);
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.status == UserStatus.loading) {
              return LoadingDataWidget();
            }

            final userData = state.userData!;
            if (!ResponsiveHelper.isMobile(context)) {
              return ProfileWideBody(
                userData: userData,
                onTapAvatar: onTapAvatar,
                onTapEditAbout: onTapEditAbout,
                onTapEditExperience: onTapEditExperience,
                onTapEditLookingFor: onTapEditLookingFor,
                onUpgrade: _onUpgrade,
                onManageSubscription: () => _onManageSubscription(context),
                onDelete: () => _onDeletePressed(context),
              );
            }
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            children: [
                              Gap(20.0),
                              BuildAbout(
                                userData: userData,
                                onTapEdit: onTapEditAbout,
                                onTapEditExperience: onTapEditExperience,
                              ),
                              Gap(20.0),
                              BuildLookingFor(
                                onTapEdit: onTapEditLookingFor,
                                userData: userData,
                              ),
                              Gap(20.0),
                              // BuildSkillsNExpertise(
                              //   onTapEdit: onTapEditSkills,
                              // ),
                              // Gap(20.0),
                              BlocBuilder<PremiumBloc, PremiumState>(
                                builder: (context, premiumState) {
                                  if (premiumState.isPremium) {
                                    return BlocBuilder<ProfileBloc,
                                        ProfileState>(
                                      builder: (context, profileState) {
                                        return PremiumStatusCard(
                                          expiresAt: premiumState
                                              .premiumStatus
                                              ?.expiresAt,
                                          willRenew:
                                              premiumState
                                                  .premiumStatus
                                                  ?.willRenew ??
                                              false,
                                          isOpeningManagement: profileState
                                              .isOpeningSubscription,
                                          onManage: () =>
                                              _onManageSubscription(context),
                                        );
                                      },
                                    );
                                  }
                                  return SizedBox(
                                    width: double.infinity,
                                    child: ActionBtn(
                                      text: AppLocalizations.of(
                                        context,
                                      )!.premium_upgrade,
                                      anyStateColor:
                                          AppColors.majorelleBlue.value,
                                      onPressed: _onUpgrade,
                                    ),
                                  );
                                },
                              ),
                              Gap(20.0),
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, profileState) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: ActionBtn(
                                      text: 'Delete account',
                                      anyStateColor: AppColors.heartRed.value,
                                      onPressed: profileState.isDeleting
                                          ? null
                                          : () => _onDeletePressed(context),
                                    ),
                                  );
                                },
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
        ),
      ),
    );
  }
}
