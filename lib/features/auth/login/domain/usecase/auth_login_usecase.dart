import 'package:injectable/injectable.dart';

import '../../data/model/request/auth_login_request_dto.dart';
import '../../data/model/response/auth_login_response.dart';
import '../repo/auth_login_repo_contract.dart';


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
