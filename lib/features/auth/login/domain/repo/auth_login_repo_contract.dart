import 'package:online_exam_app/features/auth/login/data/model/request/auth_login_request_dto.dart';
import 'package:online_exam_app/features/auth/login/data/model/response/auth_login_response.dart';

abstract class AuthLoginRepoContract {
  Future<AuthLoginResponse> login(
    AuthLoginRequestDto loginRequestDto, {
    required bool isCheckedRememberMe,
  });
}
