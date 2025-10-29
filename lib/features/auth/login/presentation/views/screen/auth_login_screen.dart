import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/validation/auth_validation.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/widgets/auth/custom_elevated_button_widget.dart';
import 'package:exam_app/core/widgets/auth/custom_rich_text_widget.dart';
import 'package:exam_app/core/widgets/auth/custom_text_field_widget.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_text_styles.dart';
import '../../../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../../../core/widgets/custom_spacer_widget.dart';

class AuthLoginScreen extends StatelessWidget {
  AuthLoginScreen({super.key});

  final AuthLoginViewModel vm = getIt<AuthLoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return CustomAppBarWidget(
      true,
      onBackPressed: () {},
      title: AppStrings.login,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: Form(
          key: vm.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomEditTextFieldWidget(
                labelText: AppStrings.emailLabel,
                hintText: AppStrings.emailHint,
                validator: AuthValidation.emailValidation,
                controller: vm.emailController,
              ),
              const CustomHeightSpaceWidget(24),
              CustomEditTextFieldWidget(
                labelText: AppStrings.passwordLabel,
                hintText: AppStrings.passwordHint,
                isPasswordField: true,
                validator: AuthValidation.passwordValidation,
                controller: vm.passwordController,
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
                  vm.login();
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
