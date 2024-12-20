class MValidators {
  MValidators._();

  // Validate if a field is not empty
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Validate email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Validate password length
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Validate phone number format
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  // Validate if two fields match (e.g., password and confirm password)
  static String? validateMatch(
      String? value, String? matchValue, String fieldName) {
    if (value != matchValue) {
      return '$fieldName does not match';
    }
    return null;
  }

  // Validate if a number is within a specified range
  static String? validateNumberRange(
      String? value, double min, double max, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    final num? number = num.tryParse(value);
    if (number == null || number < min || number > max) {
      return '$fieldName must be between $min and $max';
    }
    return null;
  }

  // Validate if an input is numeric
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    final num? number = num.tryParse(value);
    if (number == null) {
      return '$fieldName must be a number';
    }
    return null;
  }
}
