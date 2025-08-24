import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final userStatusController = ref.watch(
      userStatusControllerProvider.notifier,
    );
    final userStatusAsync = ref.watch(userStatusControllerProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final isLoading = userStatusAsync.isLoading;
    final isSignUpMode = useState(false);
    final isAwaitingEmailVerification = useState(false);
    final isResendingEmail = useState(false);

    // Navigate to appropriate page when authentication state changes
    ref.listen<AsyncValue<UserStatus?>>(userStatusControllerProvider, (
      previous,
      next,
    ) {
      if (next.hasValue && next.value != null) {
        final userStatus = next.value!;
        if (userStatus.emailVerified) {
          // Go to top page if email is verified (for both login and signup)
          context.go(const TopPageRoute().location);
        } else if (isSignUpMode.value && !isAwaitingEmailVerification.value) {
          // After signup, show email verification waiting state
          isAwaitingEmailVerification.value = true;
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAwaitingEmailVerification.value
              ? l10n.email_verification_title
              : (isSignUpMode.value ? l10n.signup_title : l10n.login_title),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),

            if (isAwaitingEmailVerification.value) ...[
              // Email Verification Waiting View
              _buildEmailVerificationView(
                context,
                ref,
                l10n,
                userStatusController,
                isResendingEmail,
                isAwaitingEmailVerification,
              ),
            ] else ...[
              // Login/Signup View
              _buildLoginSignupView(
                context,
                ref,
                l10n,
                userStatusController,
                isSignUpMode,
                emailController,
                passwordController,
                formKey,
                isLoading,
              ),
            ],

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailVerificationView(
    BuildContext context,
    WidgetRef ref,
    L10n l10n,
    UserStatusController userStatusController,
    ValueNotifier<bool> isResendingEmail,
    ValueNotifier<bool> isAwaitingEmailVerification,
  ) {
    return Column(
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
            onPressed: isResendingEmail.value
                ? null
                : () async {
                    isResendingEmail.value = true;
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
                      isResendingEmail.value = false;
                    }
                  },
            child: isResendingEmail.value
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
            onPressed: () async {
              // Force refresh auth state to check if email is verified
              final _ = ref.refresh(userStatusControllerProvider.future);
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
              isAwaitingEmailVerification.value = false;
            },
            child: Text(l10n.email_verification_back),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginSignupView(
    BuildContext context,
    WidgetRef ref,
    L10n l10n,
    UserStatusController userStatusController,
    ValueNotifier<bool> isSignUpMode,
    TextEditingController emailController,
    TextEditingController passwordController,
    GlobalKey<FormState> formKey,
    bool isLoading,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Welcome section
        Text(
          isSignUpMode.value ? l10n.signup_welcome : l10n.login_welcome,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          isSignUpMode.value ? l10n.signup_description : l10n.login_description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),

        // Email/Password Form
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                enabled: !isLoading,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: l10n.login_email,
                  hintText: l10n.login_email,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.login_email_required;
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return l10n.login_email_invalid;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                enabled: !isLoading,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.login_password,
                  hintText: l10n.login_password,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.login_password_required;
                  }
                  if (value.length < 6) {
                    return l10n.login_password_short;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Email Sign In/Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (formKey.currentState?.validate() ?? false) {
                            try {
                              if (isSignUpMode.value) {
                                await userStatusController.signUp(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );
                              } else {
                                await userStatusController.signIn(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );
                              }
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isSignUpMode.value
                                          ? l10n.signup_error_email
                                          : l10n.login_error_email,
                                    ),
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.error,
                                  ),
                                );
                              }
                            }
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          isSignUpMode.value
                              ? l10n.signup_email_button
                              : l10n.login_email_button,
                        ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Divider
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.login_or,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),

        const SizedBox(height: 32),

        // Google Sign In Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: isLoading
                ? null
                : () async {
                    try {
                      await userStatusController.signInWithGoogle();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l10n.login_error_google),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.error,
                          ),
                        );
                      }
                    }
                  },
            icon: const Icon(Icons.login, size: 20),
            label: Text(l10n.login_google),
          ),
        ),

        const SizedBox(height: 16),

        // Guest Continue Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: TextButton(
            onPressed: isLoading
                ? null
                : () {
                    context.go(const TopPageRoute().location);
                  },
            child: Text(l10n.login_guest),
          ),
        ),

        const SizedBox(height: 16),

        // Mode Switch Button
        TextButton(
          onPressed: isLoading
              ? null
              : () {
                  isSignUpMode.value = !isSignUpMode.value;
                  // Clear form when switching modes
                  emailController.clear();
                  passwordController.clear();
                },
          child: Text(
            isSignUpMode.value ? l10n.switch_to_login : l10n.switch_to_signup,
          ),
        ),
      ],
    );
  }
}
