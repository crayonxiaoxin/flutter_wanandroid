bool isEmpty(String? string) {
  if (string == null) return true;
  return string.isEmpty;
}

bool isNotEmpty(String? string) {
  return !isEmpty(string);
}
