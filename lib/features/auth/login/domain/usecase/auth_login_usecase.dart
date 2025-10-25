import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/login/data/model/request/auth_login_request_dto.dart';
import 'package:online_exam_app/features/auth/login/data/model/response/auth_login_response.dart';
import 'package:online_exam_app/features/auth/login/domain/repo/auth_login_repo_contract.dart';

@LazySingleton()
class AuthLoginUseCase {
  final AuthLoginRepoContract authLoginRepo;

  AuthLoginUseCase(this.authLoginRepo);

  Future<AuthLoginResponse> call(
    AuthLoginRequestDto loginRequestDto, {
    required bool isCheckedRememberMe,
  }) {
    return authLoginRepo.login(
      loginRequestDto,
      isCheckedRememberMe: isCheckedRememberMe,
    );
  }
}
