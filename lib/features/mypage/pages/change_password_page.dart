import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/widgets/async_widget.dart';
import 'package:idea_maker/features/mypage/controllers/change_password_controller.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';

class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final theme = Theme.of(context);

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final newPasswordVisible = useState(false);
    final confirmPasswordVisible = useState(false);

    final asyncChangePassword = ref.watch(changePasswordControllerProvider);

    Future<void> changePassword() async {
      await ref
          .read(changePasswordControllerProvider.notifier)
          .changePassword(
            newPassword: newPasswordController.text,
            confirmPassword: confirmPasswordController.text,
          );
    }

    return AsyncWidget(
      asyncChangePassword,
      builder: (state) => Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(l10n.my_page_change_password_title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: newPasswordController,
                obscureText: !newPasswordVisible.value,
                decoration: InputDecoration(
                  labelText: l10n.my_page_new_password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      newPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        newPasswordVisible.value = !newPasswordVisible.value,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: !confirmPasswordVisible.value,
                decoration: InputDecoration(
                  labelText: l10n.my_page_confirm_password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      confirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => confirmPasswordVisible.value =
                        !confirmPasswordVisible.value,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: changePassword,
                  child: Text(l10n.my_page_change_password_button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
