import 'package:go_router/go_router.dart';
import 'package:idea_maker/core/exceptions/app_exception.dart';
import 'package:idea_maker/l10n/app_localizations.dart';
import 'package:idea_maker/routers/router.dart';

class NotSignInException extends AppException {
  NotSignInException() : super();
  @override
  String title(L10n l10n) => l10n.not_sign_in_exception_title;
  @override
  String message(L10n l10n) => l10n.not_sign_in_exception_message;

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

class PasswordMismatchException extends AppException {
  PasswordMismatchException() : super();
  @override
  String title(L10n l10n) => l10n.password_mismatch_exception_title;
  @override
  String message(L10n l10n) => l10n.password_mismatch_exception_message;
}
