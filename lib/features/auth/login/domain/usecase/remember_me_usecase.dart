// import 'package:injectable/injectable.dart';
//
// import '../../../../../config/base_response/base_response.dart';
// import '../../api/model/request/auth_login_api_request.dart';
// import '../../api/model/response/auth_api_response.dart';
// import '../repo/auth_login_repo_contract.dart';
//
// @LazySingleton()
// class RememberMeUseCase {
//   final AuthLoginRepoContract authLoginRepo;
//
//   const RememberMeUseCase(this.authLoginRepo);
//
//   Future<BaseResponse<AuthApiResponse>> call(
//     AuthLoginAPiRequest loginApiRequest,
//     bool isCheckedRememberMe,
//   ) => authLoginRepo.rememberMe(loginApiRequest, isCheckedRememberMe);
// }
