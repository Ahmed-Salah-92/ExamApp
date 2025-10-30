sealed class BaseResponse<T> {}

class SuccessResponse<T> extends BaseResponse<T> {
  final T data;

  SuccessResponse({required this.data});
}

class ErrorResponse<T> extends BaseResponse<T> {
  final Exception error;
  dynamic statusCode;
  String errorMessage = "something went wrong";

  ErrorResponse({required this.error, statusCode}) {
    errorMessage = error.toString();
    statusCode = statusCode ?? 100;
  }
}
