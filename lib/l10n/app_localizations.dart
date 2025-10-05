import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
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
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[Locale('ja')];

  /// No description provided for @app_title.
  ///
  /// In ja, this message translates to:
  /// **'アイディアメーカー'**
  String get app_title;

  /// No description provided for @common_close_button.
  ///
  /// In ja, this message translates to:
  /// **'閉じる'**
  String get common_close_button;

  /// No description provided for @common_cancel_button.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get common_cancel_button;

  /// No description provided for @common_go_top_button.
  ///
  /// In ja, this message translates to:
  /// **'トップに戻る'**
  String get common_go_top_button;

  /// No description provided for @user_status_guest.
  ///
  /// In ja, this message translates to:
  /// **'ゲスト'**
  String get user_status_guest;

  /// No description provided for @user_status_noName.
  ///
  /// In ja, this message translates to:
  /// **'名無しさん'**
  String get user_status_noName;

  /// No description provided for @app_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました'**
  String get app_exception_title;

  /// No description provided for @app_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました。しばらくした後もう一度お試しください。'**
  String get app_exception_message;

  /// No description provided for @auth_Incorrect_credential_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'ログインエラー'**
  String get auth_Incorrect_credential_exception_title;

  /// No description provided for @auth_Incorrect_credential_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレスまたはパスワードが正しくありません'**
  String get auth_Incorrect_credential_exception_message;

  /// No description provided for @auth_too_many_request_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'ログインエラー'**
  String get auth_too_many_request_exception_title;

  /// No description provided for @auth_too_many_request_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'リクエストが多すぎます。しばらくした後もう一度お試しください。'**
  String get auth_too_many_request_exception_message;

  /// No description provided for @auth_expired_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'ログインエラー'**
  String get auth_expired_exception_title;

  /// No description provided for @auth_expired_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'ログイン期限がきれました。もう一度ログインしてください。'**
  String get auth_expired_exception_message;

  /// No description provided for @auth_expired_exception_action.
  ///
  /// In ja, this message translates to:
  /// **'ログアウト'**
  String get auth_expired_exception_action;

  /// No description provided for @auth_email_already_in_use_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'ログインエラー'**
  String get auth_email_already_in_use_exception_title;

  /// No description provided for @auth_email_already_in_use_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'このメールアドレスは既に利用されています。'**
  String get auth_email_already_in_use_exception_message;

  /// No description provided for @auth_weak_password_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'ログインエラー'**
  String get auth_weak_password_exception_title;

  /// No description provided for @auth_weak_password_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'パスワードを強力なものに変更してください。'**
  String get auth_weak_password_exception_message;

  /// No description provided for @not_sign_in_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'ユーザーが見つかりません'**
  String get not_sign_in_exception_title;

  /// No description provided for @not_sign_in_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'ログインできていないため操作に失敗しました。'**
  String get not_sign_in_exception_message;

  /// No description provided for @password_mismatch_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'パスワードが一致しません'**
  String get password_mismatch_exception_title;

  /// No description provided for @password_mismatch_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'新しいパスワードと確認用パスワードが一致しません。'**
  String get password_mismatch_exception_message;

  /// No description provided for @requires_recent_login_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'再認証が必要です'**
  String get requires_recent_login_exception_title;

  /// No description provided for @requires_recent_login_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'前回のログインから期間が空いているため再認証が必要です。'**
  String get requires_recent_login_exception_message;

  /// No description provided for @requires_recent_login_exception_action.
  ///
  /// In ja, this message translates to:
  /// **'再認証する'**
  String get requires_recent_login_exception_action;

  /// No description provided for @auth_invalid_continue_uri_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'URLエラー'**
  String get auth_invalid_continue_uri_exception_title;

  /// No description provided for @auth_invalid_continue_uri_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'不正なURLが指定されました。もう一度メールをご確認ください。'**
  String get auth_invalid_continue_uri_exception_message;

  /// No description provided for @auth_invalid_action_code_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'コードエラー'**
  String get auth_invalid_action_code_exception_title;

  /// No description provided for @auth_invalid_action_code_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'不正なコードが指定されました。もう一度メール送信をお試しください。'**
  String get auth_invalid_action_code_exception_message;

  /// No description provided for @unexpected_exception_title.
  ///
  /// In ja, this message translates to:
  /// **'予期せぬエラーが発生しました'**
  String get unexpected_exception_title;

  /// No description provided for @unexpected_exception_message.
  ///
  /// In ja, this message translates to:
  /// **'何度か試しても状況変わらない場合は問い合わせてください'**
  String get unexpected_exception_message;

  /// No description provided for @top_description.
  ///
  /// In ja, this message translates to:
  /// **'アイディアメーカーはマインドマップをベースにアイディアを形にするお手伝いするサービスです。\nAIの力を使いながらフラッシュアイディアを具体的なプランを持たせましょう。'**
  String get top_description;

  /// No description provided for @top_go_mind_map.
  ///
  /// In ja, this message translates to:
  /// **'マインドマップを作成する'**
  String get top_go_mind_map;

  /// No description provided for @top_go_mind_map_list.
  ///
  /// In ja, this message translates to:
  /// **'マインドマップ一覧を確認する'**
  String get top_go_mind_map_list;

  /// No description provided for @mind_map_overlay_add_child_button.
  ///
  /// In ja, this message translates to:
  /// **'子のノードを追加する'**
  String get mind_map_overlay_add_child_button;

  /// No description provided for @mind_map_overlay_add_sibling_button.
  ///
  /// In ja, this message translates to:
  /// **'兄弟のノードを追加する'**
  String get mind_map_overlay_add_sibling_button;

  /// No description provided for @mind_map_overlay_remove_button.
  ///
  /// In ja, this message translates to:
  /// **'このノードを削除する'**
  String get mind_map_overlay_remove_button;

  /// No description provided for @mind_map_list_title.
  ///
  /// In ja, this message translates to:
  /// **'マインドマップ一覧'**
  String get mind_map_list_title;

  /// No description provided for @mind_map_list_empty_message.
  ///
  /// In ja, this message translates to:
  /// **'まだマインドマップがありません'**
  String get mind_map_list_empty_message;

  /// No description provided for @mind_map_list_create_new.
  ///
  /// In ja, this message translates to:
  /// **'新しいマインドマップを作成'**
  String get mind_map_list_create_new;

  /// No description provided for @mind_map_list_tile_node_count.
  ///
  /// In ja, this message translates to:
  /// **'{count}個のノード'**
  String mind_map_list_tile_node_count(Object count);

  /// No description provided for @mind_map_list_tile_updated_at.
  ///
  /// In ja, this message translates to:
  /// **'最終更新日時:{updatedAt}'**
  String mind_map_list_tile_updated_at(Object updatedAt);

  /// No description provided for @mind_map_list_delete_button.
  ///
  /// In ja, this message translates to:
  /// **'削除'**
  String get mind_map_list_delete_button;

  /// No description provided for @mind_map_list_delete_confirm_title.
  ///
  /// In ja, this message translates to:
  /// **'マインドマップを削除'**
  String get mind_map_list_delete_confirm_title;

  /// No description provided for @mind_map_list_delete_confirm_message.
  ///
  /// In ja, this message translates to:
  /// **'\'{title}\'を削除しますか？この操作は元に戻せません。'**
  String mind_map_list_delete_confirm_message(Object title);

  /// No description provided for @mind_map_list_delete_confirm_delete_button.
  ///
  /// In ja, this message translates to:
  /// **'削除'**
  String get mind_map_list_delete_confirm_delete_button;

  /// No description provided for @login_title.
  ///
  /// In ja, this message translates to:
  /// **'ログイン'**
  String get login_title;

  /// No description provided for @login_welcome.
  ///
  /// In ja, this message translates to:
  /// **'おかえりなさい'**
  String get login_welcome;

  /// No description provided for @login_description.
  ///
  /// In ja, this message translates to:
  /// **'アカウントにログインしてマインドマップを保存・管理しましょう'**
  String get login_description;

  /// No description provided for @login_or.
  ///
  /// In ja, this message translates to:
  /// **'または'**
  String get login_or;

  /// No description provided for @login_google_button.
  ///
  /// In ja, this message translates to:
  /// **'Googleでログイン'**
  String get login_google_button;

  /// No description provided for @login_guest_button.
  ///
  /// In ja, this message translates to:
  /// **'ゲストとして続行'**
  String get login_guest_button;

  /// No description provided for @login_text_field_email.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレス'**
  String get login_text_field_email;

  /// No description provided for @login_text_field_password.
  ///
  /// In ja, this message translates to:
  /// **'パスワード'**
  String get login_text_field_password;

  /// No description provided for @login_email_button.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレスでログイン'**
  String get login_email_button;

  /// No description provided for @login_forgot_password.
  ///
  /// In ja, this message translates to:
  /// **'パスワードを忘れた方はこちら'**
  String get login_forgot_password;

  /// No description provided for @forgot_password_title.
  ///
  /// In ja, this message translates to:
  /// **'パスワードリセット'**
  String get forgot_password_title;

  /// No description provided for @forgot_password_description.
  ///
  /// In ja, this message translates to:
  /// **'登録されたメールアドレスにパスワードリセット用のリンクを送信します'**
  String get forgot_password_description;

  /// No description provided for @forgot_password_send_button.
  ///
  /// In ja, this message translates to:
  /// **'リセットメールを送信'**
  String get forgot_password_send_button;

  /// No description provided for @signUp_title.
  ///
  /// In ja, this message translates to:
  /// **'アカウント作成'**
  String get signUp_title;

  /// No description provided for @signUp_welcome.
  ///
  /// In ja, this message translates to:
  /// **'新しいアカウントを作成しましょう'**
  String get signUp_welcome;

  /// No description provided for @signUp_description.
  ///
  /// In ja, this message translates to:
  /// **'新しいアカウントを作成してマインドマップを保存・管理しましょう'**
  String get signUp_description;

  /// No description provided for @signUp_email_button.
  ///
  /// In ja, this message translates to:
  /// **'アカウントを作成'**
  String get signUp_email_button;

  /// No description provided for @signUp_error_email.
  ///
  /// In ja, this message translates to:
  /// **'アカウントの作成に失敗しました'**
  String get signUp_error_email;

  /// No description provided for @switch_to_signUp.
  ///
  /// In ja, this message translates to:
  /// **'新しいアカウントを作成'**
  String get switch_to_signUp;

  /// No description provided for @switch_to_login.
  ///
  /// In ja, this message translates to:
  /// **'既存のアカウントでログイン'**
  String get switch_to_login;

  /// No description provided for @email_verification_title.
  ///
  /// In ja, this message translates to:
  /// **'メール認証'**
  String get email_verification_title;

  /// No description provided for @email_verification_send.
  ///
  /// In ja, this message translates to:
  /// **'{email}に認証メールを送信します'**
  String email_verification_send(Object email);

  /// No description provided for @email_verification_description.
  ///
  /// In ja, this message translates to:
  /// **'メールボックスを確認して、認証リンクをクリックしてください。メールが届かない場合は、迷惑メールフォルダも確認してください。'**
  String get email_verification_description;

  /// No description provided for @email_verification_send_button.
  ///
  /// In ja, this message translates to:
  /// **'認証メールを送信する'**
  String get email_verification_send_button;

  /// No description provided for @email_verification_back.
  ///
  /// In ja, this message translates to:
  /// **'戻る'**
  String get email_verification_back;

  /// No description provided for @email_not_verified.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレスが認証されていません'**
  String get email_not_verified;

  /// No description provided for @email_change_account_button.
  ///
  /// In ja, this message translates to:
  /// **'別のアカウントでログインする'**
  String get email_change_account_button;

  /// No description provided for @my_page_title.
  ///
  /// In ja, this message translates to:
  /// **'マイページ'**
  String get my_page_title;

  /// No description provided for @my_page_account_settings.
  ///
  /// In ja, this message translates to:
  /// **'アカウント設定'**
  String get my_page_account_settings;

  /// No description provided for @my_page_change_password.
  ///
  /// In ja, this message translates to:
  /// **'パスワードを変更する'**
  String get my_page_change_password;

  /// No description provided for @my_page_delete_account.
  ///
  /// In ja, this message translates to:
  /// **'アカウントを削除する'**
  String get my_page_delete_account;

  /// No description provided for @my_page_change_password_title.
  ///
  /// In ja, this message translates to:
  /// **'パスワード変更'**
  String get my_page_change_password_title;

  /// No description provided for @my_page_current_password.
  ///
  /// In ja, this message translates to:
  /// **'現在のパスワード'**
  String get my_page_current_password;

  /// No description provided for @my_page_new_password.
  ///
  /// In ja, this message translates to:
  /// **'新しいパスワード'**
  String get my_page_new_password;

  /// No description provided for @my_page_confirm_password.
  ///
  /// In ja, this message translates to:
  /// **'パスワード確認'**
  String get my_page_confirm_password;

  /// No description provided for @my_page_change_password_button.
  ///
  /// In ja, this message translates to:
  /// **'パスワードを変更'**
  String get my_page_change_password_button;

  /// No description provided for @my_page_change_password_success.
  ///
  /// In ja, this message translates to:
  /// **'パスワードが変更されました'**
  String get my_page_change_password_success;

  /// No description provided for @my_page_change_password_error.
  ///
  /// In ja, this message translates to:
  /// **'パスワードの変更に失敗しました'**
  String get my_page_change_password_error;

  /// No description provided for @my_page_password_mismatch.
  ///
  /// In ja, this message translates to:
  /// **'パスワードが一致しません'**
  String get my_page_password_mismatch;

  /// No description provided for @my_page_delete_account_title.
  ///
  /// In ja, this message translates to:
  /// **'アカウント削除'**
  String get my_page_delete_account_title;

  /// No description provided for @my_page_delete_account_warning.
  ///
  /// In ja, this message translates to:
  /// **'アカウントを削除すると、すべてのデータが失われます。この操作は元に戻せません。'**
  String get my_page_delete_account_warning;

  /// No description provided for @my_page_delete_account_confirm.
  ///
  /// In ja, this message translates to:
  /// **'本当にアカウントを削除しますか？'**
  String get my_page_delete_account_confirm;

  /// No description provided for @my_page_delete_account_button.
  ///
  /// In ja, this message translates to:
  /// **'アカウントを削除'**
  String get my_page_delete_account_button;

  /// No description provided for @my_page_delete_account_success.
  ///
  /// In ja, this message translates to:
  /// **'アカウントが削除されました'**
  String get my_page_delete_account_success;

  /// No description provided for @my_page_logout.
  ///
  /// In ja, this message translates to:
  /// **'ログアウト'**
  String get my_page_logout;

  /// No description provided for @my_page_logout_confirm.
  ///
  /// In ja, this message translates to:
  /// **'ログアウトしますか？'**
  String get my_page_logout_confirm;

  /// No description provided for @my_page_logout_button.
  ///
  /// In ja, this message translates to:
  /// **'ログアウト'**
  String get my_page_logout_button;

  /// No description provided for @re_authenticate_title.
  ///
  /// In ja, this message translates to:
  /// **'再認証'**
  String get re_authenticate_title;

  /// No description provided for @re_authenticate_description.
  ///
  /// In ja, this message translates to:
  /// **'続行するには現在のパスワードを入力してください'**
  String get re_authenticate_description;

  /// No description provided for @re_authenticate_password_label.
  ///
  /// In ja, this message translates to:
  /// **'現在のパスワード'**
  String get re_authenticate_password_label;

  /// No description provided for @re_authenticate_button.
  ///
  /// In ja, this message translates to:
  /// **'認証する'**
  String get re_authenticate_button;

  /// No description provided for @re_authenticate_cancel.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get re_authenticate_cancel;

  /// No description provided for @reset_password_title.
  ///
  /// In ja, this message translates to:
  /// **'パスワード再設定'**
  String get reset_password_title;

  /// No description provided for @reset_password_description.
  ///
  /// In ja, this message translates to:
  /// **'新しいパスワードを入力してください'**
  String get reset_password_description;

  /// No description provided for @reset_password_new_password.
  ///
  /// In ja, this message translates to:
  /// **'新しいパスワード'**
  String get reset_password_new_password;

  /// No description provided for @reset_password_confirm_password.
  ///
  /// In ja, this message translates to:
  /// **'新しいパスワード（確認）'**
  String get reset_password_confirm_password;

  /// No description provided for @reset_password_button.
  ///
  /// In ja, this message translates to:
  /// **'パスワードを更新'**
  String get reset_password_button;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ja':
      return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
