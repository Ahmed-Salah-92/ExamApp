import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/request/auth_login_request_dto.dart';
import '../../domain/usecase/auth_login_usecase.dart';


@injectable
class LoginViewModel {
  final AuthLoginUseCase authLoginUseCase;
  LoginViewModel(this.authLoginUseCase);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login({bool isCheckedRememberMe = false}) async {
    try {
      if (formKey.currentState!.validate()) {
        var result = await authLoginUseCase.call(
          AuthLoginRequestDto(
            email: emailController.text,
            password: passwordController.text,
          ),
          isCheckedRememberMe: isCheckedRememberMe,
        );
        print('>>>>>Login Result Message: ${result.message}');
        print('>>>>>Login Result Token: ${result.token}');
        print('>>>>>Login Result User: ${result.user.toString()}');
        return result;
      }
    } catch (e) {
      print('>>>>>Login Error: $e');
      throw Exception('Login failed : $e');
    }
  }
}
