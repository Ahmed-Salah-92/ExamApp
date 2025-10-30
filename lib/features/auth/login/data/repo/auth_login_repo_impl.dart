import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../api/model/request/auth_login_api_request.dart';
import '../../api/model/response/auth_api_response.dart';
import '../../domain/repo/auth_login_repo_contract.dart';
import '../datasource/remote/auth_login_remote_datasource_contract.dart';

@Injectable(as: AuthLoginRepoContract)
class AuthLoginRepoImpl implements AuthLoginRepoContract {
  final AuthLoginRemoteDatasourceContract authLoginRemoteDatasourceContract;

  AuthLoginRepoImpl(this.authLoginRemoteDatasourceContract);

  @override
  Future<BaseResponse<AuthApiResponse>> loginRequest(
    AuthLoginAPiRequest loginApiRequest) async {
    final apiResult = await authLoginRemoteDatasourceContract.login(
      loginApiRequest,
    );
    switch (apiResult) {
      case SuccessResponse<AuthApiResponse>():
        return SuccessResponse(data: apiResult.data);
      case ErrorResponse<AuthApiResponse>():
        return ErrorResponse(error: Exception(apiResult.error));
    }
  }

  @override
  Future<BaseResponse<AuthApiResponse>> rememberMe(
    AuthLoginAPiRequest loginApiRequest,
    bool isCheckedRememberMe,
  ) {
    // TODO: implement rememberMe
    throw UnimplementedError();
  }
}
