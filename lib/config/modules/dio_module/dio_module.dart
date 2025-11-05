import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../core/values/app_endpoints_strings.dart';
// import 'auth_interceptor.dart'; // Uncomment when ready to use
// import 'error_interceptor.dart'; // Uncomment when ready to use

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          // Accept all status codes to handle errors manually
          return status != null && status < 500;
        },
      ),
    );

    // Add logging interceptor only in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
          logPrint: (obj) {
            debugPrint(obj.toString());
          },
        ),
      );
    }

    // Add custom interceptors
    //dio.interceptors.add(AuthInterceptor()); // Uncomment when ready
     //dio.interceptors.add(ErrorInterceptor()); // Uncomment when ready

    return dio;
  }
}
