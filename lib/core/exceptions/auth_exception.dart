import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/exceptions/app_exception.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/routers/router.dart';

class AuthException extends AppException {
  AuthException._() : super();
  factory AuthException.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
      case 'missing-email':
      case 'user-disabled':
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
      case 'user-mismatch':
      case 'auth/invalid_email':
      case 'auth/user-not-found':
        return AuthIncorrectCredentialException();
      case 'too-many-requests':
        return AuthTooManyRequestException();
      case 'user-token-expired':
        return AuthExpiredException();
      case 'email-already-in-use':
        return AuthEmailAlreadyInUseException();
      case 'weak-password':
        return AuthWeakPasswordException();
      case 'requires-recent-login':
        return AuthRequiresRecentLoginException();
      case 'auth/missing-continue-uri':
      case 'auth/invalid-continue-uri':
      case 'auth/unauthorized-continue-uri':
        return AuthInvalidContinueUriException();

      default:
        throw Exception();
    }
  }
  static AuthException getAuthException(Object error) {
    if (error is FirebaseAuthException) {
      return AuthException.fromFirebaseAuthException(error);
    } else {
      throw Exception('Unknown error type');
    }
  }
}

class AuthIncorrectCredentialException extends AuthException {
  AuthIncorrectCredentialException() : super._();

  @override
  String title(L10n l10n) => l10n.auth_Incorrect_credential_exception_title;
  @override
  String message(L10n l10n) => l10n.auth_Incorrect_credential_exception_message;
}

class AuthTooManyRequestException extends AuthException {
  AuthTooManyRequestException() : super._();

  @override
  String title(L10n l10n) => l10n.auth_too_many_request_exception_title;
  @override
  String message(L10n l10n) => l10n.auth_too_many_request_exception_message;

  @override
  List<Action> get actions => [
    Action(
      label: (L10n l10n) => l10n.common_go_top_button,
      action: (context, ref) {
        context.go(const TopPageRoute().location);
      },
    ),
  ];
}

class AuthExpiredException extends AuthException {
  AuthExpiredException() : super._();

  @override
  String title(L10n l10n) => l10n.auth_expired_exception_title;
  @override
  String message(L10n l10n) => l10n.auth_expired_exception_message;

  @override
  List<Action> get actions => [
    Action(
      label: (L10n l10n) => l10n.auth_expired_exception_action,
      action: (context, ref) async {
        await ref.read(userStatusControllerProvider.notifier).logout();
        if (context.mounted) {
          context.go(const LoginPageRoute().location);
        }
      },
    ),
  ];
}

class AuthEmailAlreadyInUseException extends AuthException {
  AuthEmailAlreadyInUseException() : super._();

  @override
  String title(L10n l10n) => l10n.auth_email_already_in_use_exception_title;
  @override
  String message(L10n l10n) => l10n.auth_email_already_in_use_exception_message;
}

class AuthWeakPasswordException extends AuthException {
  AuthWeakPasswordException() : super._();

  @override
  String title(L10n l10n) => l10n.auth_weak_password_exception_title;
  @override
  String message(L10n l10n) => l10n.auth_weak_password_exception_message;
}

class AuthRequiresRecentLoginException extends AuthException {
  AuthRequiresRecentLoginException() : super._();

  @override
  String title(L10n l10n) => l10n.requires_recent_login_exception_title;
  @override
  String message(L10n l10n) => l10n.requires_recent_login_exception_message;

  @override
  List<Action> get actions => [
    Action(
      label: (L10n l10n) => l10n.requires_recent_login_exception_action,
      action: (context, ref) async {
        if (context.mounted) {
          final reAuth =
              await context.push(const ReAuthenticatePageRoute().location)
                  as bool?;
          if (reAuth ?? false) {
            if (context.mounted) {
              context.pop();
            }
          }
        }
      },
    ),
  ];
}

class AuthInvalidContinueUriException extends AuthException {
  AuthInvalidContinueUriException() : super._();

  @override
  String title(L10n l10n) => l10n.auth_invalid_continue_uri_exception_title;
  @override
  String message(L10n l10n) => l10n.auth_invalid_continue_uri_exception_message;
}
