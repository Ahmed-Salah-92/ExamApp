import 'package:exam_app/features/auth/login/domain/model/login_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../api/model/request/auth_login_api_request.dart';
import '../../api/model/response/auth_login_api_response.dart';
import '../repo/auth_login_repo_contract.dart';

@LazySingleton()
class AuthLoginUseCase {
  final AuthLoginRepoContract authLoginRepo;

  AuthLoginUseCase(this.authLoginRepo);

  Future<BaseResponse<LoginResponseModel>> call(
    AuthLoginApiRequest loginApiRequest, {
    bool isCheckedRememberMe = false,
  }) => authLoginRepo.login(
    loginApiRequest,
    isCheckedRememberMe: isCheckedRememberMe,
  );
}
