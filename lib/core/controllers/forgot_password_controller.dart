import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);

  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .sendPasswordResetEmail(email)
          .then((_) => true)
          .catchErrorAsAppException(AuthException.getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }
}
