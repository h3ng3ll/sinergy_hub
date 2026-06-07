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
}
