bool isEmpty(String? string) {
  if (string == null) return true;
  return string.isEmpty;
}

bool isNotEmpty(String? string) {
  return !isEmpty(string);
}

String formatIfNull(value, {String defaultValue = ""}) {
  if (value == null || value == "null") {
    return defaultValue;
  } else {
    return value;
  }
}
