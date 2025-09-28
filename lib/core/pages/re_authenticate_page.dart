import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/re_authenticate_controller.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';

class ReAuthenticatePage extends HookConsumerWidget {
  const ReAuthenticatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final reAuthController = ref.watch(
      reAuthenticateControllerProvider.notifier,
    );
    final reAuthResultAsync = ref.watch(reAuthenticateControllerProvider);

    final passwordController = useTextEditingController();

    // Listen for successful re-authentication
    ref.listen(reAuthenticateControllerProvider, (_, result) {
      final isAuthenticated = result.valueOrNull ?? false;
      if (isAuthenticated) {
        context.pop(true);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.re_authenticate_title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: AsyncWidget(
        reAuthResultAsync,
        builder: (isAuthenticated) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Icon
                Icon(
                  Icons.security,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),

                // Title and Description
                Text(
                  l10n.re_authenticate_title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.re_authenticate_description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Password Form
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: l10n.re_authenticate_password_label,
                          hintText: l10n.re_authenticate_password_label,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Authenticate Button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            await reAuthController.reAuthenticateWithPassword(
                              passwordController.text,
                            );
                          },
                          child: Text(l10n.re_authenticate_button),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Cancel Button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextButton(
                          onPressed: () => context.pop(false),
                          child: Text(l10n.common_cancel_button),
                        ),
                      ),
                    ],
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
