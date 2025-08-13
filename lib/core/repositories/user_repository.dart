import 'package:idea_maker/core/entities/user_status.dart';

abstract interface class UserRepository {
  Future<UserStatus> signIn(String email, String password);
}
