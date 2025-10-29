import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/domain/usecase/auth_login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthLoginViewModel {
  final AuthLoginUseCase authLoginUseCase;
  AuthLoginViewModel(this.authLoginUseCase);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login({bool isCheckedRememberMe = false}) async {
    try {
      if (formKey.currentState!.validate()) {
        var result = await authLoginUseCase.call(
          AuthLoginAPiRequest(
            email: emailController.text,
            password: passwordController.text,
          ),
          isCheckedRememberMe: isCheckedRememberMe,
        );
        print('>>>>>Login Result Message: ${result.message}');
        print('>>>>>Login Result Token: ${result.token}');
        print('>>>>>Login Result User: ${result.userDto.toString()}');
        return result;
      }
    } catch (e) {
      print('>>>>>Login Error: $e');
      throw Exception('Login failed : $e');
    }
  }
}