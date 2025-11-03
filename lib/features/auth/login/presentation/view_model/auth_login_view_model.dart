import 'dart:developer';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/values/app_routes_strings.dart';
import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/domain/usecase/auth_login_usecase.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/auth_login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../domain/model/login_response_model.dart';
import 'auth_login_event.dart';

@injectable
class AuthLoginViewModel extends Cubit<AuthLoginState> {
  final AuthLoginUseCase _authLoginUseCase;
  final FlutterSecureStorage _securedPrefs;

  AuthLoginViewModel(this._authLoginUseCase, this._securedPrefs)
    : super(AuthLoginState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isCheckedRememberMe = false;

  void doIntent(AuthLoginEvent event) {
    switch (event) {
      case LoginEvent():
        _login();
      case RememberMeEvent():
        _isCheckedRememberMe = !_isCheckedRememberMe;
        _printToken();
      case SingUpEvent():
        _navigateToRegisterScreen();
      case ForgetPasswordEvent():
        _navigateToForgetPasswordScreen();
    }
  }

  bool _isValidated() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  Future _login({bool isCheckedRememberMe = false}) async {
    try {
      if (formKey.currentState!.validate()) {
        var emailParam = emailController.text.trim();
        var passwordParam = passwordController.text;
        BaseResponse<LoginResponseModel> result = await _authLoginUseCase.call(
          AuthLoginApiRequest(email: emailParam, password: passwordParam),
          isCheckedRememberMe: isCheckedRememberMe,
        );
        emit(
          state.copyWith(
            loginResponseModel: BaseState<LoginResponseModel>(isLoading: true),
          ),
        );
        switch (result) {
          case SuccessResponse<LoginResponseModel>():
            emit(
              state.copyWith(
                loginResponseModel: BaseState<LoginResponseModel>(
                  isLoading: false,
                  data: result.data,
                ),
              ),
            );
            final dataModel = result.data;
            const String emptyToken = "Empty Token";
            // must be handle isCheckedRememberMe Action
            if (isCheckedRememberMe == true) {
              await _setTokens(tokenValue: dataModel.token ?? emptyToken);
              _printSuccess(dataModel);
            }
          // _navigateToHomeScreen();
          case ErrorResponse<LoginResponseModel>():
            emit(
              state.copyWith(
                loginResponseModel: BaseState<LoginResponseModel>(
                  isLoading: false,
                  errorMessage: result.errorMessage,
                ),
              ),
            );
            _printError(result.errorMessage);
        }
        return result;
      }
    } catch (e) {
      _printException(e);
      return ErrorResponse<LoginResponseModel>(error: Exception(e.toString()));
    }
  }

  static final String _tokenKey = "token_key";



  Future _setTokens({required String tokenValue}) async {
    await _securedPrefs.write(key: _tokenKey, value: tokenValue);
  }

  Future<String> _getTokens() async {
    String? token = await _securedPrefs.read(key: _tokenKey);
    return token ?? "";
  }

  _printToken() async {
    String value = await _getTokens();
    log('>>>>>>Stored Token: $value');
  }

  _printSuccess(dynamic dataModel) {
    log('>>>>>Login Successful<<<<<<');
    log('>>>>>Login Result Message: ${dataModel.message}');
    log('>>>>>Login Result Token: ${dataModel.token}');
    log('>>>>>User Credentials<<<<<<:');
    log('>>>>>>_ID: ${dataModel.userData?.id}');
    log('>>>>>>First Name: ${dataModel.userData?.firstName}');
    log('>>>>>>Last Name: ${dataModel.userData?.lastName}');
    log('>>>>>>Created at: ${dataModel.userData?.createdAt}');
  }

  _printError(dynamic dataModel) {
    log('>>>>>Api Response Error<<<<<<');
    log('>>>>>Login Result Message: ${dataModel.message}');
  }

  _printException(dynamic e) {
    log('>>>>>UnexpectedError<<<<<<');
    log('>>>>>Exception: $e');
  }
  BuildContext? get context => null;


  _navigateToHomeScreen()  =>
      Navigator.pushNamed(context!, AppRoutesStrings.home);

  _navigateToForgetPasswordScreen() =>
      Navigator.pushNamed(context!, AppRoutesStrings.forgetPassword);

  _navigateToRegisterScreen() =>
      Navigator.pushNamed(context!, AppRoutesStrings.signup);

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
