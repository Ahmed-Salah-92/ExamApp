import '../../../../../config/base_state/base_state.dart';
import '../../domain/model/login_response_model.dart';

class AuthLoginState {
  BaseState<LoginResponseModel>? loginResponseModel;

  final NavigationAction navigationAction;

  AuthLoginState({
    this.loginResponseModel,
    this.navigationAction = NavigationAction.none,
  });

  AuthLoginState copyWith({
    BaseState<LoginResponseModel>? loginResponseModel,
    NavigationAction? navigationAction,
  }) {
    return AuthLoginState();
  }
}

enum NavigationAction { home, forgetPassword, signup, none }
