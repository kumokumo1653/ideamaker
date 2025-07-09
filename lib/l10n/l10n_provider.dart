import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_localizations.dart';

/// https://codewithandrea.com/articles/app-localizations-outside-widgets-riverpod/

final l10nProvider = Provider<L10n>((ref) {
  ref.state = lookupL10n(ui.PlatformDispatcher.instance.locale);
  final observer = _LocaleObserver((locales) {
    ref.state = lookupL10n(ui.PlatformDispatcher.instance.locale);
  });
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
});

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);

  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
