import '../../../../../../config/base_response/base_response.dart';
import '../../../api/model/request/auth_login_api_request.dart';
import '../../../api/model/response/auth_login_api_response.dart';

abstract class AuthLoginRemoteDatasourceContract {
  Future<BaseResponse<AuthLoginApiResponse>> login(AuthLoginApiRequest loginApiRequest);
}