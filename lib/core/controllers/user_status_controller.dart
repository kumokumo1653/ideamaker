import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_status_controller.g.dart';

@Riverpod(keepAlive: true)
class UserStatusController extends _$UserStatusController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);

  bool get isGuest => state.hasValue && state.value == null;

  @override
  Future<UserStatus?> build() async {
    try {
      return _userRepository.currentUser;
    } on Exception catch (e) {
      throw Exception('Failed to fetch user status: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<UserStatus?>(
      () => _userRepository.signIn(email, password),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<UserStatus?>(
      () => _userRepository.signUp(email, password),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<UserStatus?>(
      () => _userRepository.signInWithGoogle(),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> signOut() async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<UserStatus?>(
      () => _userRepository.signOut(),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> sendEmailVerification() async {
    try {
      await _userRepository.sendEmailVerification();
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
