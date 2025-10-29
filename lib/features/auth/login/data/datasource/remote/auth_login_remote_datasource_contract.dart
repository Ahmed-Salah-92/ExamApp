import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/api/model/response/auth_login_api_response.dart';

abstract class AuthLoginRemoteDatasourceContract {
  Future<AuthLoginApiResponse> login(AuthLoginAPiRequest loginApiRequest);
}