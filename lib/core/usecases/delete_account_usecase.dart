import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_account_usecase.g.dart';

@riverpod
DeleteAccountUsecase deleteAccountUsecase(Ref ref) {
  return DeleteAccountUsecase(ref);
}

class DeleteAccountUsecase {
  DeleteAccountUsecase(this.ref);
  final Ref ref;

  UserRepository get _userRepository => ref.watch(userRepositoryProvider);
  MindMapRepository get _mindMapRepository =>
      ref.watch(mindMapRepositoryProvider);

  Future<void> call() async {
    await _mindMapRepository.deleteAllMindMaps();
    await _userRepository.deleteAccount();
  }
}
