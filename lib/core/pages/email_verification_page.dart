import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/widgets/widgets.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';

class EmailVerificationPage extends HookConsumerWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final userStatusController = ref.watch(
      userStatusControllerProvider.notifier,
    );
    final userStatusAsync = ref.watch(userStatusControllerProvider);

    // Check for email verification status changes
    ref.listen<AsyncValue<UserStatus?>>(userStatusControllerProvider, (
      _,
      user,
    ) {
      // TODO(ohike): 状態の変化がこれで検知できるか確認する
      final userStatus = user.value;
      // Navigate to top page when email is verified
      if (userStatus != null && userStatus.emailVerified) {
        context.go(const TopPageRoute().location);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.email_verification_title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: AsyncWidget(
        userStatusAsync,
        builder: (userStatus) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Icon
                Icon(
                  Icons.mark_email_unread_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  l10n.email_verification_send(userStatus?.email ?? ''),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  l10n.email_verification_description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () async {
                      await userStatusController.sendEmailVerification();
                    },
                    child: Text(l10n.email_verification_send_button),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
