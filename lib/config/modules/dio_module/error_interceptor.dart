import 'package:dio/dio.dart';

/// Interceptor for handling and formatting errors
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = _getErrorMessage(err);
    
    // Log the error
    print('API Error: $errorMessage');
    
    // You can create a custom exception here if needed
    // throw CustomApiException(message: errorMessage, statusCode: err.response?.statusCode);
    
    super.onError(err, handler);
  }

  String _getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again.';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'Connection error. Please check your internet connection.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred. Please try again.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  String _handleBadResponse(Response? response) {
    if (response == null) {
      return 'No response from server.';
    }

    switch (response.statusCode) {
      case 400:
        return response.data['message'] ?? 'Bad request.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Forbidden. You don\'t have permission to access this resource.';
      case 404:
        return 'Resource not found.';
      case 422:
        return response.data['message'] ?? 'Validation error.';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return response.data['message'] ?? 'Something went wrong.';
    }
  }
}

