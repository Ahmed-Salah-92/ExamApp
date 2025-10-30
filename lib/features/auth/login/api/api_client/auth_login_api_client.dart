import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/values/app_endpoints_strings.dart';
import '../model/request/auth_login_api_request.dart';
import '../model/response/auth_api_response.dart';

part 'auth_login_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthLoginApiClient {
  @factoryMethod
  factory AuthLoginApiClient(Dio dio) = _AuthLoginApiClient;


  @POST(AppEndpoints.login)
  Future<AuthApiResponse> login(@Body() AuthLoginAPiRequest loginApiRequest);
}
