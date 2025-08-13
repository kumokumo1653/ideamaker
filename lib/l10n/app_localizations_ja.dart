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
  String get generic_error_title => 'エラーが発生しました';

  @override
  String get generic_error_content => 'エラーが発生しました。しばらくした後もう一度お試しください。';
}
