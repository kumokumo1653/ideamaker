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
    final stream = _userRepository.userStatusStream;

    // Get the first event from the stream
    final firstUserStatus = await stream.first;

    final subscription = stream
        .skip(1) // Skip the first event since we already handled it
        .handleError((Object error, StackTrace stackTrace) {
          state = AsyncValue<UserStatus?>.error(
            error,
            stackTrace,
          ).copyWithPrevious(state);
        })
        .listen((userStatus) {
          state = AsyncValue<UserStatus?>.data(
            userStatus,
          ).copyWithPrevious(state);
        });
    ref.onDispose(subscription.cancel);

    return firstUserStatus;
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue<UserStatus?>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<UserStatus?>(
      () => _userRepository.signIn(email, password),
    );

    state = newState.copyWithPrevious(state);
  }
}
