import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
import 'package:idea_maker/gen/assets.gen.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/router.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final theme = Theme.of(context);

    final userStatus = ref.watch(userStatusControllerProvider);
    return AsyncWidget(
      userStatus,
      builder: (userStatus) => Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(l10n.app_title),
          actions: [
            Text(userStatus?.displayName ?? 'Guest'),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                ref
                    .read(userStatusControllerProvider.notifier)
                    .signIn(
                      'test@gmail.com',
                      'testtest',
                    );
              },
            ),
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
                onPressed: () => const MindMapPageRoute(
                  treeId: '8516f1e5-d592-48c1-91b5-5559ecb7db1f',
                ).go(context),
                child: Text(l10n.top_go_mind_map),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
