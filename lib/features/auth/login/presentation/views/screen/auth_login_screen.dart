import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_event.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_state.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_app_bar_widget.dart';
import '../widgets/auth_login_screen_body_widget.dart';

class AuthLoginScreen extends StatelessWidget {
  AuthLoginScreen({super.key});

  final AuthLoginViewModel vm = getIt<AuthLoginViewModel>();

  void showCustomSnackBar(BuildContext ctx, String msg, Color bkgColor) =>
      ScaffoldMessenger.of(
        ctx,
      ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: bkgColor));

  @override
  Widget build(BuildContext context) {
    return CustomAppBarWidget(
      showBackButton: false,
      title: AppStrings.login,
      body: BlocProvider<AuthLoginViewModel>(
        create: (_) => vm..doIntent(LoginEvent()),
        child: BlocListener<AuthLoginViewModel, AuthLoginState>(
          listener: (_, state) {
            var loginResponseState = state.loginResponseModel;
            if (loginResponseState?.data?.message != null) {
              showCustomSnackBar(
                context,
                "${loginResponseState?.data?.message}",
                Colors.red,
              );
            } else if (loginResponseState?.data?.token != null) {
              showCustomSnackBar(
                context,
                "Login successful! Token: ${loginResponseState?.data!.token}",
                Colors.green,
              );
            }
          },
          child: AuthLoginScreenBodyWidget(loginViewModel: vm),
        ),
      ),
    );
  }
}
