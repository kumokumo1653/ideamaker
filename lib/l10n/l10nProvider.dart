import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:ideamaker/l10n/app_localizations.dart';
import 'package:riverpod/riverpod.dart';

final appLocalizationProvider = Provider<L10n>((ref) {
  ref.state = lookupL10n(ui.window.locale); // デフォルトのL10n
  final observer = _LocaleObserver((locales) {
    ref.state = lookupL10n(ui.window.locale); // 設定した言語のL10nに更新する
  });
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer); // 言語切替検知の開始
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
});

/// 言語切替を検知するためのオブザーバー
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);

  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
