import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/domain/model/login_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../api/model/response/auth_login_api_response.dart';
import '../../domain/repo/auth_login_repo_contract.dart';
import '../datasource/remote/auth_login_remote_datasource_contract.dart';

@Injectable(as: AuthLoginRepoContract)
class AuthLoginRepoImpl implements AuthLoginRepoContract {
  final AuthLoginRemoteDatasourceContract authLoginRemoteDatasourceContract;

  AuthLoginRepoImpl(this.authLoginRemoteDatasourceContract);

  @override
  Future<BaseResponse<LoginResponseModel>> login(AuthLoginApiRequest loginApiRequest, {bool isCheckedRememberMe = false}) async {
    BaseResponse<AuthLoginApiResponse> loginResponse = await authLoginRemoteDatasourceContract.login(loginApiRequest);
    switch (loginResponse) {
      case SuccessResponse<AuthLoginApiResponse>():
        AuthLoginApiResponse apiResponse = loginResponse.data;
        LoginResponseModel domainModel = apiResponse.toDomain();
        return SuccessResponse<LoginResponseModel>(data: domainModel);

      case ErrorResponse<AuthLoginApiResponse>():
        return ErrorResponse<LoginResponseModel>(
          error: loginResponse.error,
          errorMessage: loginResponse.errorMessage,
        );
    }
  }
}
