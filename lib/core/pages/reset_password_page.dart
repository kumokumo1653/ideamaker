import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/reset_password_controller.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';

/// Password reset page for setting new password after receiving reset email
class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({required this.oobCode, super.key});

  final String oobCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final passwordVisible = useState(false);
    final confirmPasswordVisible = useState(false);
    final resetPasswordController = ref.watch(
      resetPasswordControllerProvider.notifier,
    );
    final resetPasswordAsync = ref.watch(resetPasswordControllerProvider);

    // Listen for successful password reset
    ref.listen(resetPasswordControllerProvider, (_, result) {
      final isSuccess = result.valueOrNull ?? false;
      if (isSuccess) {
        _showSuccessDialog(context, l10n);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.reset_password_title),
      ),
      body: AsyncWidget(
        resetPasswordAsync,
        builder: (result) => SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Icon
              Icon(
                Icons.lock_reset,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),

              // Title and Description
              Text(
                l10n.reset_password_title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.reset_password_description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Password reset form
              Form(
                child: Column(
                  children: [
                    // New password field
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: !passwordVisible.value,
                      decoration: InputDecoration(
                        labelText: l10n.reset_password_new_password,
                        hintText: l10n.reset_password_new_password,
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            passwordVisible.value = !passwordVisible.value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Confirm password field
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !confirmPasswordVisible.value,
                      decoration: InputDecoration(
                        labelText: l10n.reset_password_confirm_password,
                        hintText: l10n.reset_password_confirm_password,
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            confirmPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            confirmPasswordVisible.value =
                                !confirmPasswordVisible.value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Reset password button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final newPassword = newPasswordController.text.trim();
                          final confirmPassword = confirmPasswordController.text
                              .trim();
                          resetPasswordController.resetPassword(
                            oobCode,
                            newPassword,
                            confirmPassword,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                        ),
                        child: Text(l10n.reset_password_button),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Show success dialog and navigate to login page
  void _showSuccessDialog(BuildContext context, L10n l10n) {
    final theme = Theme.of(context);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.check_circle,
          color: theme.colorScheme.tertiary,
          size: 48,
        ),
        title: Text(l10n.reset_password_success),
        content: Text(l10n.reset_password_success_description),
        actions: [
          TextButton(
            onPressed: () {
              context.go(const LoginPageRoute().location);
            },
            child: Text(l10n.reset_password_go_to_login),
          ),
        ],
      ),
    );
  }
}
