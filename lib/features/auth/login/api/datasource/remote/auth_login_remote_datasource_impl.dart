import 'package:dio/dio.dart';
import 'package:exam_app/features/auth/login/api/api_client/auth_login_api_client.dart';
import 'package:exam_app/features/auth/login/api/model/request/auth_login_api_request.dart';
import 'package:exam_app/features/auth/login/api/model/response/auth_login_api_response.dart';
import 'package:exam_app/features/auth/login/data/datasource/remote/auth_login_remote_datasource_contract.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthLoginRemoteDatasourceContract)
class AuthLoginRemoteDatasourceImpl
    implements AuthLoginRemoteDatasourceContract {
  final AuthLoginApiClient loginApiClient;

  AuthLoginRemoteDatasourceImpl(this.loginApiClient);

  @override
  Future<AuthLoginApiResponse> login(AuthLoginAPiRequest loginRequest) async {
    try {
      print('=== STARTING LOGIN API CALL ===');
      print('Email: ${loginRequest.email}');
      print(
        'Password: ${loginRequest.password.replaceAll(RegExp(r'.'), '*')}',
      );
      print('Request JSON: ${loginRequest.toJson()}');

       final response = await loginApiClient.login(loginRequest);

      print('=== API RESPONSE SUCCESS ===');
      print('Response: $response');
      print('Message: ${response.message}');
      print('Token: ${response.token}');
      print('User: ${response.userDto}');

      return response;
    } on DioException catch (dioError) {
      print('=== DIO EXCEPTION CAUGHT ===');
      print('Error Type: ${dioError.type}');
      print('Status Code: ${dioError.response?.statusCode}');
      print('Response Data: ${dioError.response?.data}');
      print('Request URL: ${dioError.requestOptions.uri}');
      print('Request Method: ${dioError.requestOptions.method}');
      print('Sent Data: ${dioError.requestOptions.data}');
      print('Sent Headers: ${dioError.requestOptions.headers}');

      throw Exception('Failed to login: $dioError');
    } catch (e) {
      print('=== GENERAL EXCEPTION ===');
      print('Error: $e');
      throw Exception('Failed to login: $e');
    }
  }

}