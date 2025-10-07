// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get app_title => 'アイディアメーカー';

  @override
  String get common_close_button => '閉じる';

  @override
  String get common_cancel_button => 'キャンセル';

  @override
  String get common_go_top_button => 'トップに戻る';

  @override
  String get user_status_guest => 'ゲスト';

  @override
  String get user_status_noName => '名無しさん';

  @override
  String get app_exception_title => 'エラーが発生しました';

  @override
  String get app_exception_message => 'エラーが発生しました。しばらくした後もう一度お試しください。';

  @override
  String get auth_Incorrect_credential_exception_title => 'ログインエラー';

  @override
  String get auth_Incorrect_credential_exception_message =>
      'メールアドレスまたはパスワードが正しくありません';

  @override
  String get auth_too_many_request_exception_title => 'ログインエラー';

  @override
  String get auth_too_many_request_exception_message =>
      'リクエストが多すぎます。しばらくした後もう一度お試しください。';

  @override
  String get auth_expired_exception_title => 'ログインエラー';

  @override
  String get auth_expired_exception_message => 'ログイン期限がきれました。もう一度ログインしてください。';

  @override
  String get auth_expired_exception_action => 'ログアウト';

  @override
  String get auth_email_already_in_use_exception_title => 'ログインエラー';

  @override
  String get auth_email_already_in_use_exception_message =>
      'このメールアドレスは既に利用されています。';

  @override
  String get auth_weak_password_exception_title => 'ログインエラー';

  @override
  String get auth_weak_password_exception_message => 'パスワードを強力なものに変更してください。';

  @override
  String get not_sign_in_exception_title => 'ユーザーが見つかりません';

  @override
  String get not_sign_in_exception_message => 'ログインできていないため操作に失敗しました。';

  @override
  String get password_mismatch_exception_title => 'パスワードが一致しません';

  @override
  String get password_mismatch_exception_message => '新しいパスワードと確認用パスワードが一致しません。';

  @override
  String get requires_recent_login_exception_title => '再認証が必要です';

  @override
  String get requires_recent_login_exception_message =>
      '前回のログインから期間が空いているため再認証が必要です。';

  @override
  String get requires_recent_login_exception_action => '再認証する';

  @override
  String get auth_invalid_continue_uri_exception_title => 'URLエラー';

  @override
  String get auth_invalid_continue_uri_exception_message =>
      '不正なURLが指定されました。もう一度メールをご確認ください。';

  @override
  String get auth_invalid_action_code_exception_title => 'コードエラー';

  @override
  String get auth_invalid_action_code_exception_message =>
      '不正なコードが指定されました。もう一度メール送信をお試しください。';

  @override
  String get unexpected_exception_title => '予期せぬエラーが発生しました';

  @override
  String get unexpected_exception_message => '何度か試しても状況変わらない場合は問い合わせてください';

  @override
  String get top_description =>
      'アイディアメーカーはマインドマップをベースにアイディアを形にするお手伝いするサービスです。\nAIの力を使いながらフラッシュアイディアを具体的なプランを持たせましょう。';

  @override
  String get top_go_mind_map => 'マインドマップを作成する';

  @override
  String get top_go_mind_map_list => 'マインドマップ一覧を確認する';

  @override
  String get mind_map_overlay_add_child_button => '子のノードを追加する';

  @override
  String get mind_map_overlay_add_sibling_button => '兄弟のノードを追加する';

  @override
  String get mind_map_overlay_remove_button => 'このノードを削除する';

  @override
  String get mind_map_list_title => 'マインドマップ一覧';

  @override
  String get mind_map_list_empty_message => 'まだマインドマップがありません';

  @override
  String get mind_map_list_create_new => '新しいマインドマップを作成';

  @override
  String mind_map_list_tile_node_count(Object count) {
    return '$count個のノード';
  }

  @override
  String mind_map_list_tile_updated_at(Object updatedAt) {
    return '最終更新日時:$updatedAt';
  }

  @override
  String get mind_map_list_delete_button => '削除';

  @override
  String get mind_map_list_delete_confirm_title => 'マインドマップを削除';

  @override
  String mind_map_list_delete_confirm_message(Object title) {
    return '\'$title\'を削除しますか？この操作は元に戻せません。';
  }

  @override
  String get mind_map_list_delete_confirm_delete_button => '削除';

  @override
  String get login_title => 'ログイン';

  @override
  String get login_welcome => 'おかえりなさい';

  @override
  String get login_description => 'アカウントにログインしてマインドマップを保存・管理しましょう';

  @override
  String get login_or => 'または';

  @override
  String get login_google_button => 'Googleでログイン';

  @override
  String get login_guest_button => 'ゲストとして続行';

  @override
  String get login_text_field_email => 'メールアドレス';

  @override
  String get login_text_field_password => 'パスワード';

  @override
  String get login_email_button => 'メールアドレスでログイン';

  @override
  String get login_forgot_password => 'パスワードを忘れた方はこちら';

  @override
  String get forgot_password_title => 'パスワードリセット';

  @override
  String get forgot_password_description => '登録されたメールアドレスにパスワードリセット用のリンクを送信します';

  @override
  String get forgot_password_send_button => 'リセットメールを送信';

  @override
  String get signUp_title => 'アカウント作成';

  @override
  String get signUp_welcome => '新しいアカウントを作成しましょう';

  @override
  String get signUp_description => '新しいアカウントを作成してマインドマップを保存・管理しましょう';

  @override
  String get signUp_email_button => 'アカウントを作成';

  @override
  String get signUp_error_email => 'アカウントの作成に失敗しました';

  @override
  String get switch_to_signUp => '新しいアカウントを作成';

  @override
  String get switch_to_login => '既存のアカウントでログイン';

  @override
  String get email_verification_title => 'メール認証';

  @override
  String email_verification_send(Object email) {
    return '$emailに認証メールを送信します';
  }

  @override
  String get email_verification_description =>
      'メールボックスを確認して、認証リンクをクリックしてください。メールが届かない場合は、迷惑メールフォルダも確認してください。';

  @override
  String get email_verification_send_button => '認証メールを送信する';

  @override
  String get email_verification_back => '戻る';

  @override
  String get email_not_verified => 'メールアドレスが認証されていません';

  @override
  String get email_change_account_button => '別のアカウントでログインする';

  @override
  String get my_page_title => 'マイページ';

  @override
  String get my_page_account_settings => 'アカウント設定';

  @override
  String get my_page_change_password => 'パスワードを変更する';

  @override
  String get my_page_delete_account => 'アカウントを削除する';

  @override
  String get my_page_change_password_title => 'パスワード変更';

  @override
  String get my_page_current_password => '現在のパスワード';

  @override
  String get my_page_new_password => '新しいパスワード';

  @override
  String get my_page_confirm_password => 'パスワード確認';

  @override
  String get my_page_change_password_button => 'パスワードを変更';

  @override
  String get my_page_change_password_success => 'パスワードが変更されました';

  @override
  String get my_page_change_password_error => 'パスワードの変更に失敗しました';

  @override
  String get my_page_password_mismatch => 'パスワードが一致しません';

  @override
  String get my_page_delete_account_title => 'アカウント削除';

  @override
  String get my_page_delete_account_warning =>
      'アカウントを削除すると、すべてのデータが失われます。この操作は元に戻せません。';

  @override
  String get my_page_delete_account_confirm => '本当にアカウントを削除しますか？';

  @override
  String get my_page_delete_account_button => 'アカウントを削除';

  @override
  String get my_page_delete_account_success => 'アカウントが削除されました';

  @override
  String get my_page_logout => 'ログアウト';

  @override
  String get my_page_logout_confirm => 'ログアウトしますか？';

  @override
  String get my_page_logout_button => 'ログアウト';

  @override
  String get re_authenticate_title => '再認証';

  @override
  String get re_authenticate_description => '続行するには現在のパスワードを入力してください';

  @override
  String get re_authenticate_password_label => '現在のパスワード';

  @override
  String get re_authenticate_button => '認証する';

  @override
  String get re_authenticate_cancel => 'キャンセル';

  @override
  String get reset_password_title => 'パスワード再設定';

  @override
  String get reset_password_description => '新しいパスワードを入力してください';

  @override
  String get reset_password_new_password => '新しいパスワード';

  @override
  String get reset_password_confirm_password => '新しいパスワード（確認）';

  @override
  String get reset_password_button => 'パスワードを更新';

  @override
  String get reset_password_success => 'パスワードが正常に更新されました';

  @override
  String get reset_password_success_description => '新しいパスワードでログインしてください';

  @override
  String get reset_password_go_to_login => 'ログインページへ';
}
