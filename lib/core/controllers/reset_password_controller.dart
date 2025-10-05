import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_controller.g.dart';

@riverpod
class ResetPasswordController extends _$ResetPasswordController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> resetPassword(
    String oobCode,
    String newPassword,
    String confirmPassword,
  ) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .resetPassword(oobCode, newPassword, confirmPassword)
          .then(
            (_) => true,
          )
          .catchErrorAsAppException(AuthException.getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }
}
