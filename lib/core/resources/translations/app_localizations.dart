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

  /// No description provided for @paywall_benefit_unlimited_likes.
  ///
  /// In en, this message translates to:
  /// **'Unlimited daily likes'**
  String get paywall_benefit_unlimited_likes;

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

  /// No description provided for @premium_active.
  ///
  /// In en, this message translates to:
  /// **'Premium active'**
  String get premium_active;

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
