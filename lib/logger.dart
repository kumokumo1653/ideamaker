import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 100,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);
