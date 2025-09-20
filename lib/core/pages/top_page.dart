import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
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
                onPressed: () => const LoginPageRoute().go(context),
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
