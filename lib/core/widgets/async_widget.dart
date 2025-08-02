import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/utils/logger.dart';

class AsyncWidget<T> extends HookConsumerWidget {
  const AsyncWidget(this.asyncValue, {required this.builder, super.key});

  final AsyncValue<T> asyncValue;
  final Widget Function(T) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      if (asyncValue.hasError) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => showDialog<void>(
            context: context,
            builder: (_) => ErrorDialog(
              error: asyncValue.error,
              stackTrace: asyncValue.stackTrace,
            ),
          ),
        );
      }
      return null;
    }, [asyncValue]);
    return Stack(
      children: [
        if (asyncValue.hasValue) builder(asyncValue.value as T),
        if (asyncValue.isLoading)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

class ErrorDialog extends HookConsumerWidget {
  const ErrorDialog({required this.error, required this.stackTrace, super.key});

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    useEffect(() {
      logger.e('error!!!', error: error, stackTrace: stackTrace);
      return null;
    }, [error]);
    return AlertDialog(
      title: Text(l10n.generic_error_title),
      content: Text(l10n.generic_error_content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.common_close_button),
        ),
      ],
    );
  }
}
