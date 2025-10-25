import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/login/data/datasource/remote/auth_login_remote_datasource_contract.dart';
import 'package:online_exam_app/features/auth/login/data/model/request/auth_login_request_dto.dart';
import 'package:online_exam_app/features/auth/login/data/model/response/auth_login_response.dart';
import 'package:online_exam_app/features/auth/login/domain/repo/auth_login_repo_contract.dart';

@Injectable(as: AuthLoginRepoContract)
class AuthLoginRepoImpl implements AuthLoginRepoContract {
  final AuthLoginRemoteDatasourceContract authLoginRemoteDatasourceContract;

  AuthLoginRepoImpl(this.authLoginRemoteDatasourceContract);

  @override
  Future<AuthLoginResponse> login(
    AuthLoginRequestDto loginRequestDto, {
    required bool isCheckedRememberMe,
  }) {
    try {
      final response = authLoginRemoteDatasourceContract.login(loginRequestDto);
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
