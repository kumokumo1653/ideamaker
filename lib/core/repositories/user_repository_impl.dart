import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_impl.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl();
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserStatus> signIn(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user == null) {
      throw Exception('Sign in failed');
    }
    return UserStatus(
      userId: userCredential.user!.uid,
      displayName: userCredential.user!.displayName,
      emailVerified: userCredential.user!.emailVerified,
    );
  }

  @override
  Future<UserStatus> signUp(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user == null) {
      throw Exception('Sign up failed');
    }

    // Send email verification automatically after sign up
    await userCredential.user!.sendEmailVerification();

    return UserStatus(
      userId: userCredential.user!.uid,
      displayName: userCredential.user!.displayName,
      emailVerified: userCredential.user!.emailVerified,
    );
  }

  @override
  Future<UserStatus> signInWithGoogle() async {
    final googleProvider = GoogleAuthProvider()
      ..addScope(
        'https://www.googleapis.com/auth/contacts.readonly',
      );

    // Sign in with Google
    final userCredential = await FirebaseAuth.instance.signInWithPopup(
      googleProvider,
    );

    if (userCredential.user == null) {
      throw Exception('Google sign in failed');
    }

    return UserStatus(
      userId: userCredential.user!.uid,
      displayName: userCredential.user!.displayName,
      emailVerified: userCredential.user!.emailVerified,
    );
  }

  @override
  Future<UserStatus?> signOut() async {
    await FirebaseAuth.instance.signOut();
    return null;
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Stream<UserStatus?> get userStatusStream =>
      FirebaseAuth.instance.authStateChanges().map((user) {
        if (user == null) {
          return null;
        }
        return UserStatus(
          userId: user.uid,
          displayName: user.displayName,
          emailVerified: user.emailVerified,
        );
      });
}
