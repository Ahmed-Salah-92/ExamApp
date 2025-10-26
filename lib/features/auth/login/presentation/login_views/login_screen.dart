import 'package:flutter/material.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/validation/auth_validation.dart';
import '../../../../../core/widgets/auth/custom_elevated_button_widget.dart';
import '../../../../../core/widgets/auth/custom_rich_text_widget.dart';
import '../../../../../core/widgets/auth/custom_text_field_widget.dart';
import '../login_viewmodel/login_view_model.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: loginViewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              CustomEditTextFieldWidget(
                labelText: "Email",
                hintText: "Enter your email",
                validator: AuthValidation.emailValidation,
                controller: loginViewModel.emailController,
              ),
              const SizedBox(height: 16),
              CustomEditTextFieldWidget(
                labelText: "Password",
                hintText: "Enter your password",
                isPasswordField: true,
                validator: AuthValidation.passwordValidation,
                controller: loginViewModel.passwordController,
              ),
              const SizedBox(height: 24),
              CustomElevatedButtonWidget(
                onPressed: () {
                  loginViewModel.login();
                },
                buttonText: 'Login',
              ),
              const SizedBox(height: 16),
              CustomRichTextWidget(
                onTap: () {
                  // Handle navigation to registration screen
                },
                firstText: "Don't have an account? ",
                secondText: "Register Now",
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
