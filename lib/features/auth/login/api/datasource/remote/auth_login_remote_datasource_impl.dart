import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../data/datasource/remote/auth_login_remote_datasource_contract.dart';
import '../../api_client/auth_login_api_client.dart';
import '../../model/request/auth_login_api_request.dart';
import '../../model/response/auth_login_api_response.dart';

@Injectable(as: AuthLoginRemoteDatasourceContract)
class AuthLoginRemoteDatasourceImpl implements AuthLoginRemoteDatasourceContract {
  final AuthLoginApiClient _loginApiClient;

  AuthLoginRemoteDatasourceImpl(this._loginApiClient);

  // BaseResponse<AuthLoginApiResponse> _responseFromResult(
  //    response,
  // ) {
  //   if (response.message == "success") {
  //     return SuccessResponse(data: response);
  //   } else {
  //     return ErrorResponse(
  //       error: Exception(response.message),
  //       code: response.code ?? 0,
  //     );
  //   }
  // }

  @override
  Future<BaseResponse<AuthLoginApiResponse>> login(AuthLoginApiRequest loginRequest) async {
    try {
      log('=== STARTING LOGIN API CALL ===');
      log('Email: ${loginRequest.email}');
      log('password: ${loginRequest.password}');

      AuthLoginApiResponse response = await _loginApiClient.login(loginRequest);

      log('=== API RESPONSE SUCCESS ===');
      log('Response Message: ${response.message ?? "No message"}');
      log('Token: ${response.token != null ? "Token received" : "No token"}');

      // Check if the response indicates success
      if (response.message?.toLowerCase() == "success" && response.token != null) {
        return SuccessResponse<AuthLoginApiResponse>(data: response);
      } else {
        return ErrorResponse<AuthLoginApiResponse>(
          errorMessage: response.message ?? "Login failed", error: Exception(response.message.toString()),
        );
      }
    } on DioException catch (dioError) {
      log('=== DIO EXCEPTION CAUGHT ===');
      log('Error Type: ${dioError.type}');
      log('Status Code: ${dioError.response?.statusCode}');
      log('Response Data: ${dioError.response?.data}');

      // Handle specific error cases
      String errorMessage = "Something went wrong";

      if (dioError.response != null) {
        // Extract error message from response
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic>) {
          errorMessage = responseData['message'] ?? responseData['error'] ?? errorMessage;
        } else if (responseData is String) {
          errorMessage = responseData;
        }
      } else if (dioError.type == DioExceptionType.connectionTimeout ||
                 dioError.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Connection timeout. Please check your internet connection.";
      } else if (dioError.type == DioExceptionType.connectionError) {
        errorMessage = "Connection error. Please check your internet connection.";
      }

      return ErrorResponse<AuthLoginApiResponse>(
        error: Exception(dioError.toString()),
        errorMessage: errorMessage,
      );
    } catch (e) {
      log('=== GENERAL EXCEPTION ===');
      log('Error: $e');
      log('Error Type: ${e.runtimeType}');

      return ErrorResponse<AuthLoginApiResponse>(
        error: Exception(e.toString()),
        errorMessage: "An unexpected error occurred. Please try again.",
      );
    }
  }
}
