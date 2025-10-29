import 'package:dio/dio.dart';

sealed class BaseApiResponse<T> {}

class SuccessApiResponse<T> extends BaseApiResponse<T> {
  final T data;
  SuccessApiResponse({required this.data});
}

class ErrorApiResponse<T> extends BaseApiResponse<T> {
  final Exception error;
  String errorMessage = "something went wrong";
  ErrorApiResponse({required this.error}) {
    errorMessage = error.toString();
  }
}