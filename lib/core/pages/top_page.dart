import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/entities/firebase_mail_mode.dart';
import 'package:idea_maker/core/exceptions/auth_exception.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
import 'package:idea_maker/core/widgets/error_dialog.dart';
import 'package:idea_maker/gen/assets.gen.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final theme = Theme.of(context);

    final userStatus = ref.watch(userStatusControllerProvider);
    final isMember = ref.watch(userStatusControllerProvider.notifier).isMember;

    useFirebaseContinueUrl(context);

    return AsyncWidget(
      userStatus,
      builder: (userStatus) => Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(l10n.app_title),
          actions: [
            if (isMember) ...[
              // Show email verification warning if not verified
              if (userStatus?.emailVerified == false) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton.icon(
                    onPressed: () =>
                        const EmailVerificationPageRoute().go(context),
                    icon: Icon(
                      Icons.warning,
                      color: theme.colorScheme.error,
                      size: 16,
                    ),
                    label: Text(
                      l10n.email_not_verified,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ),
                ),
              ] else ...[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Center(
                    child: Text(
                      userStatus?.displayName ?? l10n.user_status_noName,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () => const MyPageRoute().go(context),
              ),
            ] else ...[
              TextButton.icon(
                onPressed: () => context.go(
                  const LoginPageRoute().location,
                  extra: 'from TopPage',
                ),
                icon: const Icon(Icons.login),
                label: Text(l10n.login_title),
              ),
            ],
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.lib.assets.icons.logo.svg(
                width: 200,
                height: 200,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.top_description,
                  textAlign: TextAlign.center,
                ),
              ),
              FilledButton(
                onPressed: () => const MindMapPageRoute().go(context),
                child: Text(l10n.top_go_mind_map),
              ),
              if (isMember) ...[
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => const MindMapListPageRoute().go(context),
                  child: Text(l10n.top_go_mind_map_list),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

void useFirebaseContinueUrl(BuildContext context) {
  final fragmentedUri = Uri.parse(Uri.base.fragment);
  final mode = FirebaseMailMode.values.firstWhereOrNull(
    (e) => e.name == fragmentedUri.queryParameters['mode'],
  );
  final oobCode = fragmentedUri.queryParameters['oobCode'];
  if (mode != null && oobCode != null) {
    switch (mode) {
      case FirebaseMailMode.verifyEmail:
        try {
          FirebaseAuth.instance.applyActionCode(oobCode);
          // TODO(ohike): Show a snackbar
        } on Exception catch (e, stackTrace) {
          final exception = AuthException.getAuthException(e);
          showDialog<void>(
            context: context,
            builder: (_) => ErrorDialog(
              error: exception,
              stackTrace: stackTrace,
            ),
          );
        }
      case FirebaseMailMode.resetPassword:
        ResetPasswordPageRoute(
          oobCode: oobCode,
        ).go(context);
      case FirebaseMailMode.recoverEmail:
        throw UnimplementedError();
    }
  }
}
