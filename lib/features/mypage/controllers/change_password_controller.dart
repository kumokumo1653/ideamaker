import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);
  @override
  FutureOr<bool> build() => false;

  Future<void> changePassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    if (newPassword != confirmPassword) {
      state = AsyncValue<bool>.error(
        PasswordMismatchException(),
        StackTrace.current,
      ).copyWithPrevious(state);
    }
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .changePassword(newPassword)
          .then((_) => true)
          .catchErrorAsAppException(AuthException.getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }
}
