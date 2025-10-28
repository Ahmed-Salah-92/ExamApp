import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/app_text_styles.dart';
import 'package:exam_app/core/widgets/custom_app_bar_widget.dart';
import 'package:exam_app/core/widgets/custom_spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return CustomAppBarWidget(
      true,
      onBackPressed: () {},
      title: AppStrings.login,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: Form(
          key: loginViewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomEditTextFieldWidget(
                labelText: AppStrings.emailLabel,
                hintText: AppStrings.emailHint,
                validator: AuthValidation.emailValidation,
                controller: loginViewModel.emailController,
              ),
              const CustomHeightSpaceWidget(24),
              CustomEditTextFieldWidget(
                labelText: AppStrings.passwordLabel,
                hintText: AppStrings.passwordHint,
                isPasswordField: true,
                validator: AuthValidation.passwordValidation,
                controller: loginViewModel.passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false, //loginViewModel.isRememberMe,
                        onChanged: (bool? value) {
                          //loginViewModel.setRememberMe(value ?? false);
                        },
                      ),
                      Text(
                        AppStrings.rememberMe,
                        style: AppTextStyles.black13RegularInter,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Handle forget password action
                    },
                    child: Text(
                      AppStrings.forgetPassword,
                      style: AppTextStyles.black12RegularInter.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const CustomHeightSpaceWidget(48),
              CustomElevatedButtonWidget(
                onPressed: () {
                  loginViewModel.login();
                },
                buttonText: AppStrings.login,
              ),
              const CustomHeightSpaceWidget(16),
              CustomRichTextWidget(
                onTap: () {
                  // Handle navigation to registration screen
                },
                firstText: AppStrings.dontHaveAccount,
                secondText: AppStrings.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
