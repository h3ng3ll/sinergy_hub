import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @settings_background_title.
  ///
  /// In en, this message translates to:
  /// **'Background colors'**
  String get settings_background_title;

  /// No description provided for @settings_background_primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get settings_background_primary;

  /// No description provided for @settings_background_secondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get settings_background_secondary;

  /// No description provided for @settings_background_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get settings_background_reset;

  /// No description provided for @settings_background_premium_hint.
  ///
  /// In en, this message translates to:
  /// **'Premium feature — upgrade to paint the app in your own colors.'**
  String get settings_background_premium_hint;

  /// No description provided for @settings_background_picker_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settings_background_picker_cancel;

  /// No description provided for @settings_background_picker_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settings_background_picker_save;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @tell_us_about_yourself.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get tell_us_about_yourself;

  /// No description provided for @tell_about_your_experience.
  ///
  /// In en, this message translates to:
  /// **'Tell us about your experience'**
  String get tell_about_your_experience;

  /// No description provided for @how_long_are_you_learn_english.
  ///
  /// In en, this message translates to:
  /// **'How long are you learn english ?'**
  String get how_long_are_you_learn_english;

  /// No description provided for @how_ofter_are_you_use_english.
  ///
  /// In en, this message translates to:
  /// **'How long are you use english ?'**
  String get how_ofter_are_you_use_english;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get next;

  /// No description provided for @select_your_goals.
  ///
  /// In en, this message translates to:
  /// **'Select your goals'**
  String get select_your_goals;

  /// No description provided for @how_old_are_you.
  ///
  /// In en, this message translates to:
  /// **'How old are you ?'**
  String get how_old_are_you;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @notificationNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get notificationNow;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @looking_for.
  ///
  /// In en, this message translates to:
  /// **'Looking For'**
  String get looking_for;

  /// No description provided for @about_me.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about_me;

  /// Error message when email client cannot be launched
  ///
  /// In en, this message translates to:
  /// **'Could not launch email client'**
  String get could_not_launch_email;

  /// No description provided for @no_connection_title.
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get no_connection_title;

  /// No description provided for @no_connection_message.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection. We\'ll bring you back as soon as you\'re online.'**
  String get no_connection_message;

  /// No description provided for @connection_restored.
  ///
  /// In en, this message translates to:
  /// **'Connection restored'**
  String get connection_restored;

  /// No description provided for @report_user_title.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get report_user_title;

  /// No description provided for @report_user_type_label.
  ///
  /// In en, this message translates to:
  /// **'Type of complaint'**
  String get report_user_type_label;

  /// No description provided for @report_user_type_hint.
  ///
  /// In en, this message translates to:
  /// **'Select a complaint type'**
  String get report_user_type_hint;

  /// No description provided for @report_user_details_label.
  ///
  /// In en, this message translates to:
  /// **'Describe the issue'**
  String get report_user_details_label;

  /// No description provided for @report_user_details_hint.
  ///
  /// In en, this message translates to:
  /// **'Tell us what happened'**
  String get report_user_details_hint;

  /// No description provided for @report_user_details_required.
  ///
  /// In en, this message translates to:
  /// **'Please describe the issue'**
  String get report_user_details_required;

  /// No description provided for @report_user_type_required.
  ///
  /// In en, this message translates to:
  /// **'Please select a complaint type'**
  String get report_user_type_required;

  /// No description provided for @report_user_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit report'**
  String get report_user_submit;

  /// No description provided for @report_user_success.
  ///
  /// In en, this message translates to:
  /// **'Thank you. Your report has been submitted.'**
  String get report_user_success;

  /// No description provided for @report_user_rate_limited.
  ///
  /// In en, this message translates to:
  /// **'You have submitted too many reports. Please try again later.'**
  String get report_user_rate_limited;

  /// No description provided for @report_type_harassment.
  ///
  /// In en, this message translates to:
  /// **'Harassment or bullying'**
  String get report_type_harassment;

  /// No description provided for @report_type_spam.
  ///
  /// In en, this message translates to:
  /// **'Spam or scam'**
  String get report_type_spam;

  /// No description provided for @report_type_inappropriate.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate content'**
  String get report_type_inappropriate;

  /// No description provided for @report_type_fake_profile.
  ///
  /// In en, this message translates to:
  /// **'Fake profile'**
  String get report_type_fake_profile;

  /// No description provided for @report_type_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get report_type_other;

  /// No description provided for @block_user.
  ///
  /// In en, this message translates to:
  /// **'Block user'**
  String get block_user;

  /// No description provided for @unblock_user.
  ///
  /// In en, this message translates to:
  /// **'Unblock user'**
  String get unblock_user;

  /// No description provided for @chat_blocked_message.
  ///
  /// In en, this message translates to:
  /// **'Messaging is restricted in this chat'**
  String get chat_blocked_message;

  /// No description provided for @paywall_title.
  ///
  /// In en, this message translates to:
  /// **'Go Premium'**
  String get paywall_title;

  /// No description provided for @chat_empty_title.
  ///
  /// In en, this message translates to:
  /// **'Make a great first impression'**
  String get chat_empty_title;

  /// No description provided for @chat_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You matched for a reason. Say hi, be yourself. You\'ve got this! 💪'**
  String get chat_empty_subtitle;

  /// No description provided for @notifications_empty_title.
  ///
  /// In en, this message translates to:
  /// **'All quiet for now'**
  String get notifications_empty_title;

  /// No description provided for @notifications_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'When someone likes you or sends a message, you\'ll hear it here first. Good things are on their way ✨'**
  String get notifications_empty_subtitle;

  /// No description provided for @chats_empty_quote.
  ///
  /// In en, this message translates to:
  /// **'The right people don\'t arrive early, they arrive on time. Every day you wait, you\'re becoming someone worth finding. 💫'**
  String get chats_empty_quote;

  /// No description provided for @paywall_benefit_unlimited_likes.
  ///
  /// In en, this message translates to:
  /// **'Unlimited daily likes'**
  String get paywall_benefit_unlimited_likes;

  /// No description provided for @paywall_benefit_see_who_liked_you.
  ///
  /// In en, this message translates to:
  /// **'See who liked you'**
  String get paywall_benefit_see_who_liked_you;

  /// No description provided for @paywall_benefit_unlock_content.
  ///
  /// In en, this message translates to:
  /// **'Unlock Premium content'**
  String get paywall_benefit_unlock_content;

  /// No description provided for @paywall_benefit_more_visibility.
  ///
  /// In en, this message translates to:
  /// **'Get more visibility'**
  String get paywall_benefit_more_visibility;

  /// No description provided for @paywall_benefit_unlimited_interactions.
  ///
  /// In en, this message translates to:
  /// **'Enjoy unlimited interactions'**
  String get paywall_benefit_unlimited_interactions;

  /// No description provided for @paywall_benefit_exclusive_features.
  ///
  /// In en, this message translates to:
  /// **'Access exclusive features'**
  String get paywall_benefit_exclusive_features;

  /// No description provided for @paywall_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get paywall_continue;

  /// No description provided for @paywall_restore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get paywall_restore;

  /// No description provided for @paywall_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Premium is not available right now. Please try again later.'**
  String get paywall_unavailable;

  /// No description provided for @paywall_no_plans.
  ///
  /// In en, this message translates to:
  /// **'No subscription plans are available right now.'**
  String get paywall_no_plans;

  /// No description provided for @paywall_restore_nothing.
  ///
  /// In en, this message translates to:
  /// **'No previous purchases found to restore.'**
  String get paywall_restore_nothing;

  /// No description provided for @paywall_purchase_success.
  ///
  /// In en, this message translates to:
  /// **'Premium unlocked. Enjoy unlimited likes!'**
  String get paywall_purchase_success;

  /// No description provided for @paywall_auto_renew_note.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions renew automatically unless cancelled at least 24 hours before the end of the current period.'**
  String get paywall_auto_renew_note;

  /// No description provided for @paywall_best_value.
  ///
  /// In en, this message translates to:
  /// **'Best value'**
  String get paywall_best_value;

  /// No description provided for @terms_of_use.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get terms_of_use;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @premium_upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get premium_upgrade;

  /// No description provided for @premium_card_title.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium_card_title;

  /// No description provided for @premium_renews_on.
  ///
  /// In en, this message translates to:
  /// **'Renews on {date}'**
  String premium_renews_on(String date);

  /// No description provided for @premium_active_until.
  ///
  /// In en, this message translates to:
  /// **'Active until {date}'**
  String premium_active_until(String date);

  /// No description provided for @premium_active_status.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get premium_active_status;

  /// No description provided for @premium_cancel_hint.
  ///
  /// In en, this message translates to:
  /// **'You can cancel anytime in your store account. Premium stays active until the end of the paid period.'**
  String get premium_cancel_hint;

  /// No description provided for @premium_manage.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get premium_manage;

  /// No description provided for @liked_you_tab_label.
  ///
  /// In en, this message translates to:
  /// **'Liked you'**
  String get liked_you_tab_label;

  /// No description provided for @liked_you_title.
  ///
  /// In en, this message translates to:
  /// **'Liked you'**
  String get liked_you_title;

  /// Free-user quota banner on the Liked you tab
  ///
  /// In en, this message translates to:
  /// **'{remaining} of {limit} reveals left · resets {resetTime}'**
  String liked_you_quota_banner(int remaining, int limit, String resetTime);

  /// No description provided for @liked_you_locked_message.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to see who liked you'**
  String get liked_you_locked_message;

  /// No description provided for @liked_you_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No likes yet'**
  String get liked_you_empty_title;

  /// No description provided for @liked_you_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your admirers are on their way. Keep swiping and they\'ll show up here 💜'**
  String get liked_you_empty_subtitle;

  /// No description provided for @liked_you_failed_title.
  ///
  /// In en, this message translates to:
  /// **'Failed to load who liked you'**
  String get liked_you_failed_title;

  /// No description provided for @liked_you_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get liked_you_retry;

  /// No description provided for @liked_you_reload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get liked_you_reload;

  /// No description provided for @liked_you_load_more_failed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load more · Retry'**
  String get liked_you_load_more_failed;

  /// No description provided for @liked_you_just_now.
  ///
  /// In en, this message translates to:
  /// **'Liked just now'**
  String get liked_you_just_now;

  /// Relative time on a Liked you card
  ///
  /// In en, this message translates to:
  /// **'Liked {time} ago'**
  String liked_you_ago(String time);

  /// No description provided for @location_group_title.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location_group_title;

  /// No description provided for @location_country_hint.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get location_country_hint;

  /// No description provided for @location_city_hint.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get location_city_hint;

  /// No description provided for @location_use_my_location.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get location_use_my_location;

  /// No description provided for @location_open_settings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get location_open_settings;

  /// No description provided for @location_open_location_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Location Settings'**
  String get location_open_location_settings;

  /// No description provided for @filter_location_title.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get filter_location_title;

  /// No description provided for @filter_location_city_option.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get filter_location_city_option;

  /// No description provided for @filter_location_distance_option.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get filter_location_distance_option;

  /// No description provided for @filter_location_distance_locked.
  ///
  /// In en, this message translates to:
  /// **'Set your location in Edit Profile first'**
  String get filter_location_distance_locked;

  /// Selected radius on the Home filter's Distance slider
  ///
  /// In en, this message translates to:
  /// **'{km} km'**
  String filter_location_radius_km(int km);

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Synergy Hub'**
  String get app_title;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get common_save_changes;

  /// No description provided for @common_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get common_edit;

  /// No description provided for @common_updated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get common_updated;

  /// No description provided for @common_failed_to_load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get common_failed_to_load;

  /// No description provided for @common_not_specified.
  ///
  /// In en, this message translates to:
  /// **'Not specified yet'**
  String get common_not_specified;

  /// No description provided for @common_cofounder_match_hint.
  ///
  /// In en, this message translates to:
  /// **'Help us find your perfect co-founder match'**
  String get common_cofounder_match_hint;

  /// No description provided for @auth_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Synergy Hub'**
  String get auth_welcome;

  /// No description provided for @auth_continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get auth_continue_with_apple;

  /// No description provided for @auth_continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get auth_continue_with_google;

  /// No description provided for @auth_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login;

  /// No description provided for @auth_register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get auth_register;

  /// No description provided for @auth_agreement_prefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to '**
  String get auth_agreement_prefix;

  /// No description provided for @auth_agreement_terms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get auth_agreement_terms;

  /// No description provided for @auth_agreement_and.
  ///
  /// In en, this message translates to:
  /// **' & '**
  String get auth_agreement_and;

  /// No description provided for @profile_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get profile_delete_account;

  /// No description provided for @profile_account_deleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted'**
  String get profile_account_deleted;

  /// No description provided for @profile_bio_empty_prompt.
  ///
  /// In en, this message translates to:
  /// **'Tell others about yourself'**
  String get profile_bio_empty_prompt;

  /// No description provided for @profile_subscription_open_failed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open subscription settings. Manage it in your store account.'**
  String get profile_subscription_open_failed;

  /// No description provided for @edit_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile_title;

  /// No description provided for @edit_profile_updated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get edit_profile_updated;

  /// No description provided for @edit_profile_first_name.
  ///
  /// In en, this message translates to:
  /// **'FirstName'**
  String get edit_profile_first_name;

  /// No description provided for @edit_profile_last_name.
  ///
  /// In en, this message translates to:
  /// **'LastName'**
  String get edit_profile_last_name;

  /// No description provided for @edit_profile_age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get edit_profile_age;

  /// No description provided for @edit_profile_bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get edit_profile_bio;

  /// No description provided for @edit_profile_specialization.
  ///
  /// In en, this message translates to:
  /// **'Specialization'**
  String get edit_profile_specialization;

  /// No description provided for @edit_profile_skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get edit_profile_skills;

  /// No description provided for @edit_profile_photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get edit_profile_photo;

  /// No description provided for @edit_profile_personal_info.
  ///
  /// In en, this message translates to:
  /// **'Personal info'**
  String get edit_profile_personal_info;

  /// No description provided for @edit_looking_for_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Looking For'**
  String get edit_looking_for_title;

  /// No description provided for @edit_looking_for_heading.
  ///
  /// In en, this message translates to:
  /// **'Who are you looking for?'**
  String get edit_looking_for_heading;

  /// No description provided for @edit_looking_for_description.
  ///
  /// In en, this message translates to:
  /// **'Select 1-5 specializations'**
  String get edit_looking_for_description;

  /// No description provided for @edit_looking_for_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search specializations...'**
  String get edit_looking_for_search_hint;

  /// No description provided for @edit_experience_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Experience'**
  String get edit_experience_title;

  /// No description provided for @edit_experience_heading.
  ///
  /// In en, this message translates to:
  /// **'What is your experience level?'**
  String get edit_experience_heading;

  /// No description provided for @edit_specialization_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Specialization'**
  String get edit_specialization_title;

  /// No description provided for @edit_specialization_heading.
  ///
  /// In en, this message translates to:
  /// **'What is your specific specialization?'**
  String get edit_specialization_heading;

  /// No description provided for @edit_specialization_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search your specialization...'**
  String get edit_specialization_search_hint;

  /// No description provided for @common_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get common_close;

  /// No description provided for @time_just_now.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get time_just_now;

  /// Compact age of a list item in minutes
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String time_minutes_short(int minutes);

  /// Compact age of a list item in hours
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String time_hours_short(int hours);

  /// No description provided for @time_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get time_today;

  /// No description provided for @time_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get time_yesterday;

  /// No description provided for @notifications_title.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications_title;

  /// No description provided for @notifications_center_title.
  ///
  /// In en, this message translates to:
  /// **'Notification Center'**
  String get notifications_center_title;

  /// No description provided for @notifications_failed_title.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch notifications'**
  String get notifications_failed_title;

  /// No description provided for @matches_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search matches...'**
  String get matches_search_hint;

  /// No description provided for @matches_failed_load.
  ///
  /// In en, this message translates to:
  /// **'Failed load data: {error}'**
  String matches_failed_load(String error);

  /// No description provided for @matches_filter_recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get matches_filter_recent;

  /// No description provided for @matches_filter_unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get matches_filter_unread;

  /// No description provided for @matches_filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get matches_filter_all;

  /// No description provided for @matches_filter_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get matches_filter_favorites;

  /// No description provided for @matches_filter_archived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get matches_filter_archived;

  /// No description provided for @chats_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No chats yet'**
  String get chats_empty_title;

  /// No description provided for @chats_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Start connecting with others'**
  String get chats_empty_subtitle;

  /// No description provided for @chat_unknown_user.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get chat_unknown_user;

  /// No description provided for @chat_you_prefix.
  ///
  /// In en, this message translates to:
  /// **'You:'**
  String get chat_you_prefix;

  /// No description provided for @chat_archived_success.
  ///
  /// In en, this message translates to:
  /// **'Chat archived successfully'**
  String get chat_archived_success;

  /// No description provided for @chat_unarchived_success.
  ///
  /// In en, this message translates to:
  /// **'Chat unarchived successfully'**
  String get chat_unarchived_success;

  /// No description provided for @chat_added_to_favorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get chat_added_to_favorites;

  /// No description provided for @chat_removed_from_favorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get chat_removed_from_favorites;

  /// No description provided for @chat_online_now.
  ///
  /// In en, this message translates to:
  /// **'Online now'**
  String get chat_online_now;

  /// No description provided for @chat_offline_now.
  ///
  /// In en, this message translates to:
  /// **'Offline now'**
  String get chat_offline_now;

  /// No description provided for @chat_message_hint.
  ///
  /// In en, this message translates to:
  /// **'Message...'**
  String get chat_message_hint;

  /// No description provided for @status_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get status_online;

  /// No description provided for @status_offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get status_offline;

  /// No description provided for @user_profile_report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get user_profile_report;

  /// No description provided for @filters_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get filters_apply;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
