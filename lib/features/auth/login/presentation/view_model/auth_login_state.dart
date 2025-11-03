import '../../../../../config/base_state/base_state.dart';
import '../../domain/model/login_response_model.dart';

class AuthLoginState {
  BaseState<LoginResponseModel>? loginResponseModel;

  AuthLoginState copyWith({BaseState<LoginResponseModel>? loginResponseModel}) {
    return AuthLoginState();
  }
}
