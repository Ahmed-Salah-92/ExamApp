class AuthValidation {
  static String? emailValidation(String? value) {
    //   RegExp emailRegex = RegExp(
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    //   );
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (value == null) return "Email Required";
    if (value.trim().isEmpty) return "Email Required";
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";

    return null;
  }

  static String? passwordValidation(String? value) {
    final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');

    if (value == null) return "Password Required";
    if (value.trim().isEmpty) return "Password Required";
    if (value.length < 8) return "Password must be at least 8 characters";
    if (!passwordRegex.hasMatch(value)) return "Password not matched";

    return null;
  }
}
