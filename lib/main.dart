import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/router.dart';
import 'package:idea_maker/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return MaterialApp.router(
      title: l10n.app_title,
      theme: MyTheme().light(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
