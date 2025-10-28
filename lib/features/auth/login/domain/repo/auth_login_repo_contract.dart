import '../../data/model/request/auth_login_request_dto.dart';
import '../../data/model/response/auth_login_response.dart';

abstract class AuthLoginRepoContract {
  Future<AuthLoginResponse> login(
    AuthLoginRequestDto loginRequestDto, {
    required bool isCheckedRememberMe,
  });
}
