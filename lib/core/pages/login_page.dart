import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/widgets/widgets.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';

enum ViewMode {
  login,
  signup;

  String title(L10n l10n) => switch (this) {
    ViewMode.login => l10n.login_title,
    ViewMode.signup => l10n.signUp_title,
  };

  String welcomeMessage(L10n l10n) => switch (this) {
    ViewMode.login => l10n.login_welcome,
    ViewMode.signup => l10n.signUp_welcome,
  };

  String description(L10n l10n) => switch (this) {
    ViewMode.login => l10n.login_description,
    ViewMode.signup => l10n.signUp_description,
  };

  String emailButton(L10n l10n) => switch (this) {
    ViewMode.login => l10n.login_email_button,
    ViewMode.signup => l10n.signUp_email_button,
  };

  String switchButton(L10n l10n) => switch (this) {
    ViewMode.login => l10n.switch_to_signUp,
    ViewMode.signup => l10n.switch_to_login,
  };
}

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
    final viewMode = useState(ViewMode.login);

    // Navigate to appropriate page when authentication state changes
    ref.listen(userStatusControllerProvider, (_, user) {
      final userStatus = user.value;
      if (userStatus != null) {
        context.go(const TopPageRoute().location);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(viewMode.value.title(l10n)),
      ),
      body: AsyncWidget(
        userStatusAsync,
        builder: (userStatus) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Welcome section
                Text(
                  viewMode.value.welcomeMessage(l10n),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  viewMode.value.description(l10n),
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
                          labelText: l10n.login_text_field_email,
                          hintText: l10n.login_text_field_email,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        enabled: !isLoading,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: l10n.login_text_field_password,
                          hintText: l10n.login_text_field_password,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Email Sign In/Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (isLoading) return;
                            switch (viewMode.value) {
                              case ViewMode.login:
                                await userStatusController.signIn(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );
                              case ViewMode.signup:
                                await userStatusController.signUp(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );
                            }
                          },
                          child: Text(viewMode.value.emailButton(l10n)),
                        ),
                      ),
                    ],
                  ),
                ),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          l10n.login_or,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),

                // Google Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      if (isLoading) return;
                      await userStatusController.signInWithGoogle();
                    },
                    icon: const Icon(Icons.login, size: 20),
                    label: Text(l10n.login_google_button),
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
                    child: Text(l10n.login_guest_button),
                  ),
                ),

                const SizedBox(height: 16),

                // Mode Switch Button
                TextButton(
                  onPressed: () {
                    viewMode.value = viewMode.value == ViewMode.login
                        ? ViewMode.signup
                        : ViewMode.login;
                    // Clear form when switching modes
                    emailController.clear();
                    passwordController.clear();
                  },
                  child: Text(viewMode.value.switchButton(l10n)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
