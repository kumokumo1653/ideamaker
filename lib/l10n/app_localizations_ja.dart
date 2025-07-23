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
  String get mind_map_overlay_add_child_button_label => '子のノードを追加する';

  @override
  String get mind_map_overlay_add_sibling_button_label => '兄弟のノードを追加する';

  @override
  String get mind_map_overlay_remove_button_label => 'このノードを削除する';
}
