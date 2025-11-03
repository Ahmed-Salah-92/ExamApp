import '../../../../../config/base_response/base_response.dart';
import '../../api/model/request/auth_login_api_request.dart';
import '../model/login_response_model.dart';

abstract class AuthLoginRepoContract {
  Future<BaseResponse<LoginResponseModel>> login(
    AuthLoginApiRequest loginApiRequest, {
    bool isCheckedRememberMe,
  });
}
