import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_status_controller.g.dart';

@Riverpod(keepAlive: true)
class UserStatusController extends _$UserStatusController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);

  // TODO(ohike): とりあえずログインする
  @override
  FutureOr<UserStatus?> build() =>
      _userRepository.signIn('test@gmail.com', 'testtest');

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final userStatus = await _userRepository.signIn(email, password);

    state = AsyncValue<UserStatus?>.data(userStatus).copyWithPrevious(state);
  }
}
