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

dynamic validateEmail(String email) {
  final RegExp exp =
      RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  if (exp.allMatches(email).length > 0) {
    return null;
  } else {
    return 'Enter a valid email.';
  }
}

dynamic validateWebsite(String email) {
  final RegExp exp = RegExp(
      r"(^(?:https?://|s?ftps?://)?(?!www | www\.)[A-Za-z0-9_-]+\.+[A-Za-z0-9.\/%&=\?_:;-]+$)");
  if (exp.allMatches(email).length > 0 || email.isEmpty) {
    return null;
  } else {
    return 'Enter a valid URL.';
  }
}

dynamic validateName(String name) {
  final RegExp exp = new RegExp('[A-Za-z]{2,25}( [A-Za-z]{2,25})?');
  if (exp.allMatches(name).length > 0) {
    return null;
  } else {
    return 'Enter a valid name.';
  }
}
