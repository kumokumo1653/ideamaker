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

  /// No description provided for @generic_error_title.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました'**
  String get generic_error_title;

  /// No description provided for @generic_error_content.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました。しばらくした後もう一度お試しください。'**
  String get generic_error_content;
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
