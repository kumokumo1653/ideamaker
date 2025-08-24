import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/entities/entities.dart';
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

    final isResending = useState(false);

    // Check for email verification status changes
    ref.listen<AsyncValue<UserStatus?>>(userStatusControllerProvider, (
      previous,
      next,
    ) {
      if (next.hasValue && next.value != null) {
        final userStatus = next.value!;
        // Navigate to top page when email is verified
        if (userStatus.emailVerified) {
          context.go(const TopPageRoute().location);
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.email_verification_title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
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
              l10n.email_verification_sent,
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

            // Resend Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: isResending.value
                    ? null
                    : () async {
                        isResending.value = true;
                        try {
                          await userStatusController.sendEmailVerification();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.email_verification_sent),
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('エラーが発生しました: $e'),
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                              ),
                            );
                          }
                        } finally {
                          isResending.value = false;
                        }
                      },
                child: isResending.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.email_verification_resend),
              ),
            ),

            const SizedBox(height: 16),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: userStatusAsync.isLoading
                    ? null
                    : () async {
                        // Force refresh auth state to check if email is verified
                        final _ = ref.refresh(
                          userStatusControllerProvider.future,
                        );
                      },
                child: Text(l10n.email_verification_continue),
              ),
            ),

            const SizedBox(height: 16),

            // Back Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {
                  context.go(const LoginPageRoute().location);
                },
                child: Text(l10n.email_verification_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
