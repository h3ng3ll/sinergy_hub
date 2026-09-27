// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get year => 'year';

  @override
  String get name => 'Name';

  @override
  String get tell_us_about_yourself => 'Tell us about yourself';

  @override
  String get tell_about_your_experience => 'Tell us about your experience';

  @override
  String get how_long_are_you_learn_english =>
      'How long are you learn english ?';

  @override
  String get how_ofter_are_you_use_english => 'How long are you use english ?';

  @override
  String get next => 'next';

  @override
  String get select_your_goals => 'Select your goals';

  @override
  String get how_old_are_you => 'How old are you ?';

  @override
  String get clear => 'Clear';

  @override
  String get finish => 'Finish';

  @override
  String get notificationNow => 'now';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get looking_for => 'Looking For';

  @override
  String get about_me => 'About';

  @override
  String get could_not_launch_email => 'Could not launch email client';

  @override
  String get no_connection_title => 'No connection';

  @override
  String get no_connection_message =>
      'Please check your internet connection. We\'ll bring you back as soon as you\'re online.';

  @override
  String get connection_restored => 'Connection restored';

  @override
  String get report_user_title => 'Report user';

  @override
  String get report_user_type_label => 'Type of complaint';

  @override
  String get report_user_type_hint => 'Select a complaint type';

  @override
  String get report_user_details_label => 'Describe the issue';

  @override
  String get report_user_details_hint => 'Tell us what happened';

  @override
  String get report_user_details_required => 'Please describe the issue';

  @override
  String get report_user_type_required => 'Please select a complaint type';

  @override
  String get report_user_submit => 'Submit report';

  @override
  String get report_user_success =>
      'Thank you. Your report has been submitted.';

  @override
  String get report_user_rate_limited =>
      'You have submitted too many reports. Please try again later.';

  @override
  String get report_type_harassment => 'Harassment or bullying';

  @override
  String get report_type_spam => 'Spam or scam';

  @override
  String get report_type_inappropriate => 'Inappropriate content';

  @override
  String get report_type_fake_profile => 'Fake profile';

  @override
  String get report_type_other => 'Other';

  @override
  String get block_user => 'Block user';

  @override
  String get unblock_user => 'Unblock user';

  @override
  String get chat_blocked_message => 'Messaging is restricted in this chat';

  @override
  String get paywall_title => 'Go Premium';

  @override
  String get chat_empty_title => 'Make a great first impression';

  @override
  String get chat_empty_subtitle =>
      'You matched for a reason. Say hi, be yourself. You\'ve got this! 💪';

  @override
  String get notifications_empty_title => 'All quiet for now';

  @override
  String get notifications_empty_subtitle =>
      'When someone likes you or sends a message, you\'ll hear it here first. Good things are on their way ✨';

  @override
  String get chats_empty_quote =>
      'The right people don\'t arrive early, they arrive on time. Every day you wait, you\'re becoming someone worth finding. 💫';

  @override
  String get paywall_benefit_unlimited_likes => 'Unlimited daily likes';

  @override
  String get paywall_benefit_see_who_liked_you => 'See who liked you';

  @override
  String get paywall_benefit_unlock_content => 'Unlock Premium content';

  @override
  String get paywall_benefit_more_visibility => 'Get more visibility';

  @override
  String get paywall_benefit_unlimited_interactions =>
      'Enjoy unlimited interactions';

  @override
  String get paywall_benefit_exclusive_features => 'Access exclusive features';

  @override
  String get paywall_continue => 'Continue';

  @override
  String get paywall_restore => 'Restore purchases';

  @override
  String get paywall_unavailable =>
      'Premium is not available right now. Please try again later.';

  @override
  String get paywall_no_plans =>
      'No subscription plans are available right now.';

  @override
  String get paywall_restore_nothing =>
      'No previous purchases found to restore.';

  @override
  String get paywall_purchase_success =>
      'Premium unlocked. Enjoy unlimited likes!';

  @override
  String get paywall_auto_renew_note =>
      'Subscriptions renew automatically unless cancelled at least 24 hours before the end of the current period.';

  @override
  String get paywall_best_value => 'Best value';

  @override
  String get terms_of_use => 'Terms of Use';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get premium_upgrade => 'Upgrade to Premium';

  @override
  String get premium_active => 'Premium active';

  @override
  String get liked_you_tab_label => 'Liked you';

  @override
  String get liked_you_title => 'Liked you';

  @override
  String liked_you_quota_banner(int remaining, int limit, String resetTime) {
    return '$remaining of $limit reveals left · resets $resetTime';
  }

  @override
  String get liked_you_locked_message => 'Upgrade to see who liked you';

  @override
  String get liked_you_empty_title => 'No likes yet';

  @override
  String get liked_you_empty_subtitle =>
      'Your admirers are on their way. Keep swiping and they\'ll show up here 💜';

  @override
  String get liked_you_failed_title => 'Failed to load who liked you';

  @override
  String get liked_you_retry => 'Retry';

  @override
  String get liked_you_reload => 'Reload';

  @override
  String get liked_you_load_more_failed => 'Couldn\'t load more · Retry';

  @override
  String get liked_you_just_now => 'Liked just now';

  @override
  String liked_you_ago(String time) {
    return 'Liked $time ago';
  }
}
