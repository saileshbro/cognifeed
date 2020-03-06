dynamic validatePassword(String value) {
  if (value.length < 8) {
    return "Password must be at-least 8 chars long.";
  }

  if (!RegExp(r"([a-z])").hasMatch(value)) {
    return "Password must have one lowercase char.";
  }
  if (!RegExp(r"([0-9])").hasMatch(value)) {
    return "Password must have one number.";
  }
  return null;
}

dynamic validatePhone(String value) {
  try {
    int.parse(value);
  } catch (e) {
    return "Invalid Phone number!";
  }
  return null;
}
