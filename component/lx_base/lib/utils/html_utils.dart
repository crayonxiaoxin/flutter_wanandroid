import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:lx_base/utils/string_utils.dart';

String parseHtml(String? html) {
  if (isEmpty(html)) return "";
  Document document = parse(html);
  return document.body?.text ?? "";
}
