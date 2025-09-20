import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
import 'package:idea_maker/features/mypage/controllers/delete_account_controller.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final theme = Theme.of(context);
    final userStatus = ref.watch(userStatusControllerProvider);
    final deleteAccountState = ref.watch(deleteAccountControllerProvider);

    Future<void> handleDeleteAccountTap() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.my_page_delete_account_title),
          content: Text(l10n.my_page_delete_account_warning),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.common_cancel_button),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
              ),
              child: Text(l10n.my_page_delete_account_button),
            ),
          ],
        ),
      );

      if (confirmed ?? false) {
        await ref
            .read(deleteAccountControllerProvider.notifier)
            .deleteAccount();
        if (context.mounted) {
          const TopPageRoute().go(context);
        }
      }
    }

    Future<void> handleLogoutTap() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.my_page_logout),
          content: Text(l10n.my_page_logout_confirm),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.common_cancel_button),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.my_page_logout_button),
            ),
          ],
        ),
      );

      if (confirmed ?? false) {
        await ref.read(userStatusControllerProvider.notifier).logout();
        if (context.mounted) {
          const TopPageRoute().go(context);
        }
      }
    }

    return AsyncWidget2(
      userStatus,
      deleteAccountState,
      builder: (userStatus, deleteAccountState) => Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(l10n.my_page_title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User information section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 48,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userStatus?.displayName ??
                                      l10n.user_status_noName,
                                  style: theme.textTheme.headlineSmall,
                                ),
                                if (userStatus?.email != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    userStatus!.email!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Account settings section
              Text(
                l10n.my_page_account_settings,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              // Change password
              Card(
                child: ListTile(
                  leading: const Icon(Icons.lock),
                  title: Text(l10n.my_page_change_password),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => const ChangePasswordPageRoute().go(context),
                ),
              ),

              const SizedBox(height: 8),

              // Delete account
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.delete_forever,
                    color: theme.colorScheme.error,
                  ),
                  title: Text(
                    l10n.my_page_delete_account,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: handleDeleteAccountTap,
                ),
              ),

              const SizedBox(height: 24),

              // Logout
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: handleLogoutTap,
                  icon: const Icon(Icons.logout),
                  label: Text(l10n.my_page_logout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
