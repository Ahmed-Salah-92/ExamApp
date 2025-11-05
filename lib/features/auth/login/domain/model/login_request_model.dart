import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});
}
