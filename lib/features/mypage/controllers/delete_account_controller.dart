import 'package:idea_maker/core/controllers/controllers.dart';
import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/usecases/delete_account_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_account_controller.g.dart';

@riverpod
class DeleteAccountController extends _$DeleteAccountController {
  DeleteAccountUsecase get _deleteAccountUsecase =>
      ref.watch(deleteAccountUsecaseProvider);
  UserStatusController get _userStatusController =>
      ref.watch(userStatusControllerProvider.notifier);
  @override
  FutureOr<bool> build() => false;

  Future<void> deleteAccount() async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    final newState = await AsyncValue.guard<bool>(
      () async {
        try {
          await _deleteAccountUsecase();
          await _userStatusController.logout();
          return true;
        } on Exception catch (_) {
          throw AppException();
        }
      },
    );

    state = newState.copyWithPrevious(state);
  }
}
