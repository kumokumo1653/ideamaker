import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/user_status.dart';
import 'package:idea_maker/core/repositories/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl();
}

abstract interface class UserRepository {
  Future<UserStatus> signIn(String email, String password);

  Stream<UserStatus?> get userStatusStream;
}
