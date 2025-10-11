import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/widgets/widgets.dart';

class AsyncWidget<T> extends HookConsumerWidget {
  const AsyncWidget(this.asyncValue, {required this.builder, super.key});

  final AsyncValue<T> asyncValue;
  final Widget Function(T) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValues = [asyncValue];
    final isLoading = asyncValues.any((asyncValue) => asyncValue.isLoading);
    final hasValue = asyncValues.every((asyncValue) => asyncValue.hasValue);
    return ErrorDialogPresenter(
      asyncValues: asyncValues,
      child: Stack(
        children: [
          if (hasValue) builder(asyncValue.value as T),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class AsyncWidget2<T1, T2> extends HookConsumerWidget {
  const AsyncWidget2(
    this.asyncValue1,
    this.asyncValue2, {
    required this.builder,
    super.key,
  });

  final AsyncValue<T1> asyncValue1;
  final AsyncValue<T2> asyncValue2;
  final Widget Function(T1, T2) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValues = [asyncValue1, asyncValue2];

    final isLoading = asyncValues.any((asyncValue) => asyncValue.isLoading);
    final hasValue = asyncValues.every((asyncValue) => asyncValue.hasValue);
    return ErrorDialogPresenter(
      asyncValues: asyncValues,
      child: Stack(
        children: [
          if (hasValue)
            builder(asyncValue1.value as T1, asyncValue2.value as T2),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class ErrorDialogPresenter extends HookConsumerWidget {
  const ErrorDialogPresenter({
    required this.asyncValues,
    required this.child,
    super.key,
  });

  final List<AsyncValue<dynamic>> asyncValues;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isErrorDialogShown = useState(false);

    final error = asyncValues.firstWhereOrNull(
      (asyncValue) => !asyncValue.isLoading && asyncValue.hasError,
    );

    useEffect(() {
      if (error != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Check if the widget is still mounted before accessing useState
          if (!context.mounted) return;
          if (isErrorDialogShown.value) return;
          isErrorDialogShown.value = true;
          showDialog<void>(
            context: context,
            builder: (_) => ErrorDialog(
              error: error.error,
              stackTrace: error.stackTrace,
            ),
          ).then((_) {
            // Check if the widget is still mounted before accessing useState
            if (context.mounted) {
              isErrorDialogShown.value = false;
            }
          });
        });
      }
      return null;
    }, [error]);
    return child;
  }
}
