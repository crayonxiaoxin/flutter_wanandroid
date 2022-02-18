import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter(printTime: true));

var loggerNoStack =
    Logger(printer: PrettyPrinter(printTime: true, methodCount: 0));
