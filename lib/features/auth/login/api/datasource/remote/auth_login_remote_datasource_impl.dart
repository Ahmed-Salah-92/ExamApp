import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../data/datasource/remote/auth_login_remote_datasource_contract.dart';
import '../../api_client/auth_login_api_client.dart';
import '../../model/request/auth_login_api_request.dart';
import '../../model/response/auth_api_response.dart';

@Injectable(as: AuthLoginRemoteDatasourceContract)
class AuthLoginRemoteDatasourceImpl
    implements AuthLoginRemoteDatasourceContract {
  final AuthLoginApiClient loginApiClient;

  AuthLoginRemoteDatasourceImpl(this.loginApiClient);

  @override
  Future<BaseResponse<AuthApiResponse>> login(
    AuthLoginAPiRequest loginRequest,
  ) async {
    final response = await loginApiClient.login(loginRequest);
    try {
      log('=== STARTING LOGIN API CALL ===');
      log('Email: ${loginRequest.email}');
      log('Password: ${loginRequest.password.replaceAll(RegExp(r'.'), '*')}');
      log('Request JSON: ${loginRequest.toJson()}');

      log('=== API RESPONSE SUCCESS ===');
      log('Response: $response');
      log('Message: ${response.message}');
      log('Token: ${response.token}');
      log('User: ${response.user}');

      return SuccessResponse(data: response);
    } on DioException catch (dioError) {
      log('=== DIO EXCEPTION CAUGHT ===');
      log('Error Type: ${dioError.type}');
      log('Status Code: ${dioError.response?.statusCode}');
      log('Response Data: ${dioError.response?.data}');
      log('Request URL: ${dioError.requestOptions.uri}');
      log('Request Method: ${dioError.requestOptions.method}');
      log('Sent Data: ${dioError.requestOptions.data}');
      log('Sent Headers: ${dioError.requestOptions.headers}');
      return ErrorResponse(error: dioError, statusCode: dioError.response?.statusCode);
    } catch (e) {
      log('=== GENERAL EXCEPTION ===');
      log('Error: $e');
      return ErrorResponse(error: Exception(response.message), statusCode: response.code);
    }
  }
}
