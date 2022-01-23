replaceHtmlEntity(String? text) {
  text = text ?? "";
  return text
      .replaceAll("&mdash;", "-")
      .replaceAll("&amp;", "&")
      .replaceAll("&ldquo;", "\"")
      .replaceAll("&rdquo;", "\"")
      .replaceAll("&middot;", "·");
}
