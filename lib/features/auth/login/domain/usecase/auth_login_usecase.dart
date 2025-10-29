import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/features/auth/login/domain/repo/auth_login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthLoginUseCase {
  final AuthLoginRepoContract authLoginRepo;

  AuthLoginUseCase(this.authLoginRepo);

  Future<AuthLoginApiResponse> call(
    AuthLoginAPiRequest loginApiRequest, {
    required bool isCheckedRememberMe,
  }) {
    return authLoginRepo.login(
      loginApiRequest,
      isCheckedRememberMe: isCheckedRememberMe,
    );
  }
}
