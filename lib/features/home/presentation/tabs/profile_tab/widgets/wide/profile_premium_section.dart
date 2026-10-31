import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../subscription/presentation/bloc/premium_bloc/premium_bloc.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';
import '../premium_status_card.dart';
import 'premium_upgrade_card.dart';

class ProfilePremiumSection extends StatelessWidget {
  final VoidCallback onUpgrade;
  final VoidCallback onManage;

  const ProfilePremiumSection({
    super.key,
    required this.onUpgrade,
    required this.onManage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremiumBloc, PremiumState>(
      builder: (context, premiumState) {
        if (!premiumState.isPremium) {
          return PremiumUpgradeCard(
            onUpgrade: onUpgrade,
          );
        }
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, profileState) {
            return PremiumStatusCard(
              expiresAt: premiumState.premiumStatus?.expiresAt,
              willRenew: premiumState.premiumStatus?.willRenew ?? false,
              isOpeningManagement: profileState.isOpeningSubscription,
              onManage: onManage,
            );
          },
        );
      },
    );
  }
}
