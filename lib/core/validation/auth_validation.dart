class AuthValidation {
  static String? emailValidation(String? value) {
    if (value == null) return "Email Required";
    if (value.trim().isEmpty) return "Email Required";

    //   RegExp emailRegExp = RegExp(
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    //   );
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) return "Enter a valid email";

    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null) return "Password Required";
    if (value.trim().isEmpty) return "Password Required";
    if (value.length < 8) return "Password must be at least 8 characters";

    final passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return "Password must contain numbers, letters,and special character";
    }

    return null;
  }
}
