import 'package:flutter/material.dart';

import '../../view_model/auth_login_event.dart';
import '../../view_model/auth_login_view_model.dart';

class AuthLoginScreenCheckboxSectionWidget extends StatefulWidget {
  final AuthLoginViewModel loginViewModel;

  const AuthLoginScreenCheckboxSectionWidget({super.key, required this.loginViewModel});

  @override
  State<AuthLoginScreenCheckboxSectionWidget> createState() => _AuthLoginScreenCheckboxSectionWidgetState();
}

class _AuthLoginScreenCheckboxSectionWidgetState extends State<AuthLoginScreenCheckboxSectionWidget> {
    bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    final vm = widget.loginViewModel;
    return  Checkbox(
      value: isRememberMe,
      onChanged: (bool? value) {
        final bool newValue = value ?? false;
        setState(() {
          isRememberMe = newValue;
          vm.doIntent(RememberMeEvent());
        });
      },
    );
  }
}
