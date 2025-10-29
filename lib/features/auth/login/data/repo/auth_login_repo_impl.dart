import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/features/auth/login/data/datasource/remote/auth_login_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/login/domain/repo/auth_login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLoginRepoContract)
class AuthLoginRepoImpl implements AuthLoginRepoContract {
  final AuthLoginRemoteDatasourceContract authLoginRemoteDatasourceContract;

  AuthLoginRepoImpl(this.authLoginRemoteDatasourceContract);

  @override
  Future<AuthLoginApiResponse> login(
    AuthLoginAPiRequest loginApiRequest, {
    required bool isCheckedRememberMe,
  }) {
    try {
      final response = authLoginRemoteDatasourceContract.login(loginApiRequest);
      if (isCheckedRememberMe) {
        // Handle remember me logic save credentials securely
      }
      return response;
    } catch (e) {
      print('>>>>>Login Error: $e');
      throw Exception('Login failed : $e');
    }
  }
}
