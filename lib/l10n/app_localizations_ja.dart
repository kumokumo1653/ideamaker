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
  String get user_status_guest => 'ゲスト';

  @override
  String get user_status_noName => '名無しさん';

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
  String get generic_error_title => 'エラーが発生しました';

  @override
  String get generic_error_content => 'エラーが発生しました。しばらくした後もう一度お試しください。';

  @override
  String get login_title => 'ログイン';

  @override
  String get login_welcome => 'おかえりなさい';

  @override
  String get login_description => 'アカウントにログインしてマインドマップを保存・管理しましょう';

  @override
  String get login_or => 'または';

  @override
  String get login_google => 'Googleでログイン';

  @override
  String get login_guest => 'ゲストとして続行';

  @override
  String get login_email => 'メールアドレス';

  @override
  String get login_password => 'パスワード';

  @override
  String get login_email_button => 'メールアドレスでログイン';

  @override
  String get login_email_required => 'メールアドレスを入力してください';

  @override
  String get login_email_invalid => '有効なメールアドレスを入力してください';

  @override
  String get login_password_required => 'パスワードを入力してください';

  @override
  String get login_password_short => 'パスワードは6文字以上で入力してください';

  @override
  String get login_error_email => 'メールアドレスまたはパスワードが正しくありません';

  @override
  String get login_error_google => 'Googleログインに失敗しました';

  @override
  String get signup_title => 'アカウント作成';

  @override
  String get signup_welcome => '新しいアカウントを作成しましょう';

  @override
  String get signup_description => '新しいアカウントを作成してマインドマップを保存・管理しましょう';

  @override
  String get signup_email_button => 'アカウントを作成';

  @override
  String get signup_error_email => 'アカウントの作成に失敗しました';

  @override
  String get switch_to_signup => '新しいアカウントを作成';

  @override
  String get switch_to_login => '既存のアカウントでログイン';

  @override
  String get email_verification_title => 'メール認証';

  @override
  String get email_verification_sent => '認証メールを送信しました';

  @override
  String get email_verification_description =>
      'メールボックスを確認して、認証リンクをクリックしてください。メールが届かない場合は、迷惑メールフォルダも確認してください。';

  @override
  String get email_verification_resend => '認証メールを再送信';

  @override
  String get email_verification_continue => '認証後、続行';

  @override
  String get email_verification_back => '戻る';

  @override
  String get email_not_verified => 'メールアドレスが認証されていません';
}
