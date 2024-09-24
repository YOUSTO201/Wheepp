// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Wheepp`
  String get welcome {
    return Intl.message(
      'Welcome to Wheepp',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Choose your language to get started`
  String get choose {
    return Intl.message(
      'Choose your language to get started',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `(Device's language)`
  String get mainlanguage {
    return Intl.message(
      '(Device\'s language)',
      name: 'mainlanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message(
      'Get Started',
      name: 'GetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Start with Login or Signup`
  String get LoginorSignup {
    return Intl.message(
      'Start with Login or Signup',
      name: 'LoginorSignup',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get LoginButton {
    return Intl.message(
      'Login',
      name: 'LoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get SignupButton {
    return Intl.message(
      'Signup',
      name: 'SignupButton',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enterpass {
    return Intl.message(
      'Enter your password',
      name: 'Enterpass',
      desc: '',
      args: [],
    );
  }

  /// `field is required`
  String get fieldIsRequired {
    return Intl.message(
      'field is required',
      name: 'fieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `New in wheepp? `
  String get NewInWheepp {
    return Intl.message(
      'New in wheepp? ',
      name: 'NewInWheepp',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get InvalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'InvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong credentials`
  String get WrongCredentials {
    return Intl.message(
      'Wrong credentials',
      name: 'WrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests, Try again later`
  String get TooManyRequest {
    return Intl.message(
      'Too many requests, Try again later',
      name: 'TooManyRequest',
      desc: '',
      args: [],
    );
  }

  /// `There was an error`
  String get Error {
    return Intl.message(
      'There was an error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get Ok {
    return Intl.message(
      'ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Oops, you You did not verify your email yet, we sent you a link, Please tap on it and enter your credentials again`
  String get OopsLogin {
    return Intl.message(
      'Oops, you You did not verify your email yet, we sent you a link, Please tap on it and enter your credentials again',
      name: 'OopsLogin',
      desc: '',
      args: [],
    );
  }

  /// `example@gmail.com`
  String get HintTextEmail {
    return Intl.message(
      'example@gmail.com',
      name: 'HintTextEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new strong password`
  String get HintTextPassword {
    return Intl.message(
      'Enter a new strong password',
      name: 'HintTextPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancle`
  String get Close {
    return Intl.message(
      'Cancle',
      name: 'Close',
      desc: '',
      args: [],
    );
  }

  /// `We sent you a link in the email Please tap on it and enter your credentials again`
  String get OopsSignup {
    return Intl.message(
      'We sent you a link in the email Please tap on it and enter your credentials again',
      name: 'OopsSignup',
      desc: '',
      args: [],
    );
  }

  /// `Have An Account? `
  String get HaveAnAccount {
    return Intl.message(
      'Have An Account? ',
      name: 'HaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get WeakPassword {
    return Intl.message(
      'The password is too weak',
      name: 'WeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This email is already taken for another account`
  String get EmailAlreadyInUse {
    return Intl.message(
      'This email is already taken for another account',
      name: 'EmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Changing the Language`
  String get ChangeLanguage {
    return Intl.message(
      'Changing the Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your favourite Language`
  String get ChooseNewLanguage {
    return Intl.message(
      'Please choose your favourite Language',
      name: 'ChooseNewLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Varify the identity is required logout`
  String get VarifyToLogout {
    return Intl.message(
      'Varify the identity is required logout',
      name: 'VarifyToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Clear chat`
  String get ClearChat {
    return Intl.message(
      'Clear chat',
      name: 'ClearChat',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get Message {
    return Intl.message(
      'Message',
      name: 'Message',
      desc: '',
      args: [],
    );
  }

  /// `delete Account`
  String get DeleteAccount {
    return Intl.message(
      'delete Account',
      name: 'DeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this Account?`
  String get ShowDiaologDeleteAccount {
    return Intl.message(
      'Are you sure to delete this Account?',
      name: 'ShowDiaologDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sorry but you must tap in words and icons`
  String get TapInWordsAndIcons {
    return Intl.message(
      'Sorry but you must tap in words and icons',
      name: 'TapInWordsAndIcons',
      desc: '',
      args: [],
    );
  }

  /// `This is your private email account`
  String get PrivateEmailAccount {
    return Intl.message(
      'This is your private email account',
      name: 'PrivateEmailAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sorry but you must logout and login again`
  String get SorryButYouMustLogoutAndLoginAgain {
    return Intl.message(
      'Sorry but you must logout and login again',
      name: 'SorryButYouMustLogoutAndLoginAgain',
      desc: '',
      args: [],
    );
  }

  /// `You cann't delete the account when you Signout`
  String get CannotDelete {
    return Intl.message(
      'You cann`t delete the account when you Signout',
      name: 'CannotDelete',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get SendResetPassword {
    return Intl.message(
      'Send code',
      name: 'SendResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email to send link to Reset the Password`
  String get ResetPassword {
    return Intl.message(
      'Enter your Email to send link to Reset the Password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `The link is sent successfully`
  String get TheLinkIsSentSuccessfully {
    return Intl.message(
      'The link is sent successfully',
      name: 'TheLinkIsSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get PleaseEnterYourEmailAddress {
    return Intl.message(
      'Please enter your email address',
      name: 'PleaseEnterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Bad Network`
  String get BadNetwork {
    return Intl.message(
      'Bad Network',
      name: 'BadNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Send again`
  String get SendVerificationAgain {
    return Intl.message(
      'Send again',
      name: 'SendVerificationAgain',
      desc: '',
      args: [],
    );
  }

  /// `The account has been deleted successfully`
  String get DeletedSucceed {
    return Intl.message(
      'The account has been deleted successfully',
      name: 'DeletedSucceed',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully logged out`
  String get LogoutSucceed {
    return Intl.message(
      'You have successfully logged out',
      name: 'LogoutSucceed',
      desc: '',
      args: [],
    );
  }

  /// `Varify the identity is required to delete the Account`
  String get VarifyToDeleteTheAccount {
    return Intl.message(
      'Varify the identity is required to delete the Account',
      name: 'VarifyToDeleteTheAccount',
      desc: '',
      args: [],
    );
  }

  /// `The account Verification link has been sent again`
  String get SubmitedSucceed {
    return Intl.message(
      'The account Verification link has been sent again',
      name: 'SubmitedSucceed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
