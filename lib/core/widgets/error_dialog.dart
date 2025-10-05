import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';

class ErrorDialog extends HookConsumerWidget {
  const ErrorDialog({required this.error, required this.stackTrace, super.key});

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    if (error is! AppException) {
      return AlertDialog(
        title: Text(l10n.unexpected_exception_title),
        content: Text(l10n.unexpected_exception_message),
      );
    }
    final exception = error! as AppException;
    return AlertDialog(
      title: Text(exception.title(l10n)),
      content: Text(exception.message(l10n)),
      actions: exception.actions
          .map(
            (action) => TextButton(
              onPressed: () {
                action.action(context, ref);
              },
              child: Text(action.label(l10n)),
            ),
          )
          .toList(),
    );
  }
}
