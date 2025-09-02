import 'package:idea_maker/core/entities/user_status.dart';

abstract interface class UserRepository {
  Future<UserStatus?> get currentUser;

  Future<UserStatus> signIn(String email, String password);

  Future<UserStatus> signUp(String email, String password);

  Future<UserStatus> signInWithGoogle();

  Future<UserStatus?> signOut();

  Future<void> sendEmailVerification();
}
