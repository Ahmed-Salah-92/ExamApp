import '../../model/request/auth_login_request_dto.dart';
import '../../model/response/auth_login_response.dart';

abstract class AuthLoginRemoteDatasourceContract {
  Future<AuthLoginResponse> login(AuthLoginRequestDto loginRequestDto);
}
