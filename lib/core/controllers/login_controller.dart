import 'package:firebase_auth/firebase_auth.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
/// login state controller
/// true: logged in successfully
/// false: logged in not attempted
class LoginController extends _$LoginController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .signIn(email, password)
          .then((userStatus) {
            ref.read(userStatusControllerProvider.notifier).login(userStatus);
            return true;
          })
          .catchErrorAsAppException(getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .signUp(email, password)
          .then((userStatus) {
            ref.read(userStatusControllerProvider.notifier).login(userStatus);
            return true;
          })
          .catchErrorAsAppException(getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .signInWithGoogle()
          .then((userStatus) {
            ref.read(userStatusControllerProvider.notifier).login(userStatus);
            return true;
          })
          .catchErrorAsAppException(getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }

  AuthException getAuthException(Object error) {
    if (error is FirebaseAuthException) {
      return AuthException.fromFirebaseAuthException(error);
    } else {
      throw Exception('Unknown error type');
    }
  }
}
