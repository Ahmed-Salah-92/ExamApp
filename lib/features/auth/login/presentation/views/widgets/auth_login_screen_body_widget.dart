import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/validation/auth_validation.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../../../../core/values/app_text_styles.dart';
import '../../../../../../core/widgets/auth/custom_elevated_button_widget.dart';
import '../../../../../../core/widgets/auth/custom_rich_text_widget.dart';
import '../../../../../../core/widgets/auth/custom_text_field_widget.dart';
import '../../../../../../core/widgets/custom_spacer_widget.dart';
import '../../view_model/auth_login_event.dart';
import '../../view_model/auth_login_view_model.dart';
import 'auth_login_screen_checkbox_section_widget.dart';

class AuthLoginScreenBodyWidget extends StatelessWidget {
  final AuthLoginViewModel loginViewModel;

  const AuthLoginScreenBodyWidget({super.key, required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    final vm = loginViewModel;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
      child: Form(
        key: vm.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email EtTxt
            CustomEditTextFieldWidget(
              labelText: AppStrings.emailLabel,
              hintText: AppStrings.emailHint,
              validator: AuthValidation.emailValidation,
              controller: vm.emailController,
            ),
            const CustomHeightSpaceWidget(24),
            // Password EtTxt
            CustomEditTextFieldWidget(
              labelText: AppStrings.passwordLabel,
              hintText: AppStrings.passwordHint,
              isPasswordField: true,
              validator: AuthValidation.passwordValidation,
              controller: vm.passwordController,
            ),
            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AuthLoginScreenCheckboxSectionWidget(loginViewModel: vm),
                    Text(
                      AppStrings.rememberMe,
                      style: AppTextStyles.black13RegularInter,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => vm.doIntent(ForgetPasswordEvent()),
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
            // Login Btn
            CustomElevatedButtonWidget(
              onPressed: () {
                bool isLoginValidate = vm.formKey.currentState?.validate() ?? false;
                if (isLoginValidate) return vm.doIntent(LoginEvent());
              },
              buttonText: AppStrings.login,
            ),
            const CustomHeightSpaceWidget(16),
            // Don't Have Account
            CustomRichTextWidget(
              onTap: () => vm.doIntent(SingUpEvent()),
              firstText: AppStrings.dontHaveAccount,
              secondText: AppStrings.signUp,
            ),
          ],
        ),
      ),
    );
  }
}
