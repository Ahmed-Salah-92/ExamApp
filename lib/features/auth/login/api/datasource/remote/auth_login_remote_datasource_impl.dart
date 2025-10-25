import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/login/api/api_client/auth_login_api_client.dart';
import 'package:online_exam_app/features/auth/login/data/datasource/remote/auth_login_remote_datasource_contract.dart';
import 'package:online_exam_app/features/auth/login/data/model/request/auth_login_request_dto.dart';
import 'package:online_exam_app/features/auth/login/data/model/response/auth_login_response.dart';

@Injectable(as: AuthLoginRemoteDatasourceContract)
class AuthLoginRemoteDatasourceImpl
    implements AuthLoginRemoteDatasourceContract {
  final AuthLoginApiClient loginApiClient;

  AuthLoginRemoteDatasourceImpl(this.loginApiClient);

  @override
  Future<AuthLoginResponse> login(AuthLoginRequestDto loginRequestDto) async {
    try {
      print('=== STARTING LOGIN API CALL ===');
      print('Email: ${loginRequestDto.email}');
      print(
        'Password: ${loginRequestDto.password.replaceAll(RegExp(r'.'), '*')}',
      );
      print('Request JSON: ${loginRequestDto.toJson()}');

      final response = await loginApiClient.login(loginRequestDto);

      print('=== API RESPONSE SUCCESS ===');
      print('Response: $response');
      print('Message: ${response.message}');
      print('Token: ${response.token}');
      print('User: ${response.user}');

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
