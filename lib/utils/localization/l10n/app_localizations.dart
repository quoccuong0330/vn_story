import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @loginScreenLogin.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get loginScreenLogin;

  /// No description provided for @loginScreenEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginScreenEmail;

  /// No description provided for @loginScreenHintEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get loginScreenHintEmail;

  /// No description provided for @loginScreenPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginScreenPassword;

  /// No description provided for @loginScreenHintPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get loginScreenHintPassword;

  /// No description provided for @loginScreenRemember.
  ///
  /// In en, this message translates to:
  /// **'Remember'**
  String get loginScreenRemember;

  /// No description provided for @loginScreenForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginScreenForgotPassword;

  /// No description provided for @loginScreenOtherWay.
  ///
  /// In en, this message translates to:
  /// **'Or sign up with'**
  String get loginScreenOtherWay;

  /// No description provided for @loginScreenNotHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do not have account?'**
  String get loginScreenNotHaveAccount;

  /// No description provided for @loginScreenRegisterNow.
  ///
  /// In en, this message translates to:
  /// **'Register now'**
  String get loginScreenRegisterNow;

  /// No description provided for @loginScreenEmailValid.
  ///
  /// In en, this message translates to:
  /// **'Email is not valid.'**
  String get loginScreenEmailValid;

  /// No description provided for @loginScreenPasswordValid.
  ///
  /// In en, this message translates to:
  /// **'Password is not valid.'**
  String get loginScreenPasswordValid;

  /// No description provided for @registerScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerScreenTitle;

  /// No description provided for @registerScreenEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerScreenEmail;

  /// No description provided for @registerScreenHintEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get registerScreenHintEmail;

  /// No description provided for @registerScreenCheckedPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password again'**
  String get registerScreenCheckedPassword;

  /// No description provided for @registerScreenPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerScreenPassword;

  /// No description provided for @registerScreenHintPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get registerScreenHintPassword;

  /// No description provided for @registerScreenHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'You have account?'**
  String get registerScreenHaveAccount;

  /// No description provided for @registerScreenLoginNow.
  ///
  /// In en, this message translates to:
  /// **'Login now'**
  String get registerScreenLoginNow;

  /// No description provided for @registerScreenEmailValid.
  ///
  /// In en, this message translates to:
  /// **'Email is not valid.'**
  String get registerScreenEmailValid;

  /// No description provided for @registerScreenPasswordValid.
  ///
  /// In en, this message translates to:
  /// **'Password is not valid.'**
  String get registerScreenPasswordValid;

  /// No description provided for @registerScreenCheckedPasswordValid.
  ///
  /// In en, this message translates to:
  /// **'Refill Password is not equal password.'**
  String get registerScreenCheckedPasswordValid;

  /// No description provided for @dialogOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get dialogOtpTitle;

  /// No description provided for @dialogOtpSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your OTP has been send your email'**
  String get dialogOtpSubTitle;

  /// No description provided for @dialogOtpNoReceive.
  ///
  /// In en, this message translates to:
  /// **'Not receive OTP'**
  String get dialogOtpNoReceive;

  /// No description provided for @dialogOtpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get dialogOtpResend;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
