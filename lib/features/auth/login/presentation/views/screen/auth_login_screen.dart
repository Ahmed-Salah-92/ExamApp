import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/validation/auth_validation.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/widgets/auth/custom_elevated_button_widget.dart';
import 'package:exam_app/core/widgets/auth/custom_rich_text_widget.dart';
import 'package:exam_app/core/widgets/auth/custom_text_field_widget.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_event.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_state.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_text_styles.dart';
import '../../../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../../../core/widgets/custom_spacer_widget.dart';
import '../widgets/custom_snack_bar_widget.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final AuthLoginViewModel vm = getIt<AuthLoginViewModel>();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthLoginViewModel>(
      create: (context) => vm..doIntent(LoginEvent()),
      child: BlocListener<AuthLoginViewModel, AuthLoginState>(
        listener: (context, state) {
          if (state.loginResponseModel?.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${state.loginResponseModel!.errorMessage}"),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state.loginResponseModel?.data?.token != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Login successful! Token: ${state.loginResponseModel!.data!.token}",
                ),
                backgroundColor: Colors.green,
              ),
            );
            // TODO: Navigate to home screen
          }
        },
        child: CustomAppBarWidget(
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
                  BlocBuilder<AuthLoginViewModel, AuthLoginState>(
                    builder: (context, state) {
                      return CustomEditTextFieldWidget(
                        labelText: AppStrings.emailLabel,
                        hintText: AppStrings.emailHint,
                        validator: AuthValidation.emailValidation,
                        controller: vm.emailController,
                      );
                    },
                  ),
                  const CustomHeightSpaceWidget(24),
                  BlocBuilder<AuthLoginViewModel, AuthLoginState>(
                    builder: (context, state) {
                      return CustomEditTextFieldWidget(
                        labelText: AppStrings.passwordLabel,
                        hintText: AppStrings.passwordHint,
                        isPasswordField: true,
                        validator: AuthValidation.passwordValidation,
                        controller: vm.passwordController,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isRememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                isRememberMe = value ?? false;
                                vm.doIntent(RememberMeEvent());
                              });
                            },
                          ),
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
                  BlocBuilder<AuthLoginViewModel, AuthLoginState>(
                    builder: (context, state) {
                      // Show loading indicator when loading
                      if (state.loginResponseModel?.isLoading == true) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // Show login button
                      return CustomElevatedButtonWidget(
                        onPressed: () {
                          if (state.loginResponseModel?.errorMessage != null) {
                            CustomSnackBarWidget(
                              "Something went wrong",
                              AppColors.error,
                            );
                          }
                          if (state.loginResponseModel?.data?.token != null) {
                            CustomSnackBarWidget(
                              "Login successful! Token: ${state.loginResponseModel?.data?.token}",
                              AppColors.green,
                            );
                          }
                        },
                        buttonText: AppStrings.login,
                      );
                    },
                  ),
                  const CustomHeightSpaceWidget(16),
                  CustomRichTextWidget(
                    onTap: () => vm.doIntent(SingUpEvent()),
                    firstText: AppStrings.dontHaveAccount,
                    secondText: AppStrings.signUp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
