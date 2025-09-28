import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_status_controller.g.dart';

@Riverpod(keepAlive: true)
class UserStatusController extends _$UserStatusController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);
  bool get isMember =>
      state.hasValue && state.value != null && state.value!.emailVerified;

  @override
  Future<UserStatus?> build() async {
    return _userRepository.currentUser.catchErrorAsAppException(
      (_) => AppException(),
    );
  }

  void login(UserStatus userStatus) {
    state = AsyncValue<UserStatus?>.data(userStatus).copyWithPrevious(state);
  }

  Future<void> logout() async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<UserStatus?>(
      () => _userRepository.signOut().catchErrorAsAppException(
        (_) => AppException(),
      ),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> sendEmailVerification() async {
    await _userRepository.sendEmailVerification().catchErrorAsAppException(
      (_) => AppException(),
    );
  }
}
