import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/firebase_options.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';
import 'package:idea_maker/theme.dart';
import 'package:idea_maker/utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaEnterpriseProvider(
      'aaaaa',
    ), // TODO(ohike): (実際のサイトキー)
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  if (kDebugMode) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  runApp(
    ProviderScope(observers: [ProviderObserverLogger()], child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    // TODO(ohike): ログインがめんどくさいので、仮でログインしておく
    ref.watch(userStatusControllerProvider);
    return MaterialApp.router(
      title: l10n.app_title,
      theme: MyTheme().light(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
