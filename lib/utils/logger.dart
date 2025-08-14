import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 100,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

class ProviderObserverLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.t(
      '🌱 ${provider.name ?? provider.runtimeType}, Value: $value',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.t(
      '🔄 ${provider.name ?? provider.runtimeType}, New Value: $newValue',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    logger.t('📦${provider.name ?? provider.runtimeType}');
  }
}
