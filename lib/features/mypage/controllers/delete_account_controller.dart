import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_account_controller.g.dart';

@riverpod
class DeleteAccountController extends _$DeleteAccountController {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);
  @override
  FutureOr<bool> build() => false;

  Future<void> deleteAccount() async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () => _userRepository
          .deleteAccount()
          .then((_) => true)
          .catchErrorAsAppException(AuthException.getAuthException),
    );

    state = newState.copyWithPrevious(state);
  }
}
