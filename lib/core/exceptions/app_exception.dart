import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/utils/logger.dart';

class AppException implements Exception {
  String title(L10n l10n) => l10n.app_exception_title;
  String message(L10n l10n) => l10n.app_exception_message;
  List<Action> get actions => [];
}

class Action {
  Action({
    required this.label,
    required this.action,
  });
  final String Function(L10n l10n) label;
  final void Function(BuildContext context, WidgetRef ref) action;
}

extension FutureExt<T> on Future<T> {
  Future<T> catchErrorAsAppException(
    AppException Function(Object error) getException,
  ) {
    return catchError((Object error) {
      logger.e(error.toString());
      throw getException(error);
    });
  }
}
