import 'package:idea_maker/core/exceptions/app_exception.dart';
import 'package:idea_maker/l10n/app_localizations.dart';

class OutputInvalidException extends AppException {
  OutputInvalidException() : super();
  @override
  String title(L10n l10n) => l10n.output_invalid_exception_title;
  @override
  String message(L10n l10n) => l10n.output_invalid_exception_message;
}
