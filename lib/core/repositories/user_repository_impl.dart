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
    final user = userCredential.user;
    if (user == null) {
      throw Exception('Sign up failed');
    }
    return UserStatus(
      userId: user.uid,
      displayName: user.displayName,
      emailVerified: user.emailVerified,
      email: user.email,
    );
  }

  @override
  Future<UserStatus> signUp(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final user = userCredential.user;
    if (user == null) {
      throw Exception('Sign up failed');
    }

    return UserStatus(
      userId: user.uid,
      displayName: user.displayName,
      emailVerified: user.emailVerified,
      email: user.email,
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

    final user = userCredential.user;
    if (user == null) {
      throw Exception('Google sign in failed');
    }

    return UserStatus(
      userId: user.uid,
      displayName: user.displayName,
      emailVerified: user.emailVerified,
      email: user.email,
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
  Future<UserStatus?> get currentUser async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return UserStatus(
      userId: user.uid,
      displayName: user.displayName,
      emailVerified: user.emailVerified,
      email: user.email,
    );
  }
}
