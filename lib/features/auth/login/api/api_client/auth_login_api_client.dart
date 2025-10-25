import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/app_endpoints_strings.dart';
import 'package:online_exam_app/features/auth/login/data/model/request/auth_login_request_dto.dart';
import 'package:online_exam_app/features/auth/login/data/model/response/auth_login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_login_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthLoginApiClient {
  @factoryMethod
  factory AuthLoginApiClient(Dio dio) = _AuthLoginApiClient;

  @POST(AppEndpoints.login)
  Future<AuthLoginResponse> login(@Body() AuthLoginRequestDto loginRequestDto);
}
