class ManagementsAuth {
  // Todo : Email Validations
  static bool validateEmail(String email) {
    // Regular expression pattern for email validation
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    // Check if the email matches the pattern
    if (emailRegex.hasMatch(email)) {
      return true; // Valid email
    } else {
      return false; // Invalid email
    }
  }

  // Todo : Password Validations
  static dynamic validatePassword(String password) {
    if (password.length < 8) {
      return 'Password should contain at least 8 characters';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password should contain at least one uppercase letter';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password should contain at least one lowercase letter';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password should contain at least one digit';
    }

    return null;
  }
}
