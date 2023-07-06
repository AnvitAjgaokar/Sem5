class PasswordValidator {
  static bool? validate(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }

    if (password.length < 8) {
      return false;
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    return null;
  }
}
