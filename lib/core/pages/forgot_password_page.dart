import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/controllers.dart';
import 'package:idea_maker/core/widgets/widgets.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';

/// Password reset page for sending password reset email
class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final emailController = useTextEditingController();
    final forgotPasswordController = ref.watch(
      forgotPasswordControllerProvider.notifier,
    );
    final forgotPasswordAsync = ref.watch(forgotPasswordControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.forgot_password_title),
      ),
      body: AsyncWidget(
        forgotPasswordAsync,
        builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Description
                Text(
                  l10n.forgot_password_description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),

                // Email input form
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: l10n.login_text_field_email,
                          hintText: l10n.login_text_field_email,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Send reset email button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            final email = emailController.text.trim();
                            await forgotPasswordController
                                .sendPasswordResetEmail(email);
                          },
                          child: Text(l10n.forgot_password_send_button),
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
