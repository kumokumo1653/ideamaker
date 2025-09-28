import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 're_authenticate_controller.g.dart';

@riverpod
class ReAuthenticateController extends _$ReAuthenticateController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);

  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> reAuthenticateWithPassword(String password) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .reAuthenticateWithPassword(password)
          .then((userStatus) => true)
          .catchErrorAsAppException(AuthException.getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }
}
