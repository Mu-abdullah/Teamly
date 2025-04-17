import '../language/lang_keys.dart';

class Validator {
  // Regex pattern for Egyptian phone numbers (01*********)
  static final RegExp _phoneRegex = RegExp(
    r'^01[0125]\d{8}$', // Starts with 010, 011, 012, or 015 followed by 8 digits
  );

  // Regex pattern for basic email validation
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  static String? validatePhoneOrEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.requiredValue;
    }

    if (isPhoneValid(value)) return null;
    if (isEmailValid(value)) return null;

    return '${LangKeys.writeEmailCorrect} ${LangKeys.writePhoneCorrect}';
  }

  static bool isPhoneValid(String phone) {
    // Remove any whitespace or special characters
    final cleanedPhone = phone.replaceAll(RegExp(r'[\s+-]'), '');
    return _phoneRegex.hasMatch(cleanedPhone);
  }

  static bool isEmailValid(String email) {
    return _emailRegex.hasMatch(email);
  }

  // Optional: Get formatted phone number
  static String? formatPhone(String phone) {
    if (!isPhoneValid(phone)) return null;
    return '+20 ${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7)}';
  }

  // Error messages
  static String get phoneError => LangKeys.phoneStartWith;
  static String get emailError => LangKeys.writeEmailCorrect;
}

class InputValidator {
  // Check if the input is a valid email
  static bool isEmail(String input) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }

  // Check if the input is a valid number (integer or decimal)
  static bool isNumber(String input) {
    const pattern = r'^[+-]?\d+(\.\d+)?$';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
}
