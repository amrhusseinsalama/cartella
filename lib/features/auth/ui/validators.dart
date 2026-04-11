class AppValidator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return "Email required";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return "Password required";
    if (value.length < 6) return "Min 6 characters";
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) return "Name required";
    if (value.length < 3) return "Too short";
    return null;
  }
}