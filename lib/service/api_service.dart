import 'dart:io';
import 'package:dio/dio.dart';
import 'package:saheel_machine_test/utils/config.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Modify request options before sending
        // For example, you can add headers here
        options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Handle response
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // Handle errors
        print('Error: ${e.message}');
        if (e.type == DioExceptionType.connectionTimeout) {
          return handler.reject(DioException(
            requestOptions: e.requestOptions,
            message: 'Connection Timeout',
          ));
        } else if (e.response != null) {
          return handler.reject(DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            message: 'Received invalid status code: ${e.response?.statusCode}',
          ));
        } else {
          return handler.reject(DioException(
            requestOptions: e.requestOptions,
            message: 'Unexpected error: ${e.message}',
          ));
        }
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Add other HTTP methods as needed (PUT, DELETE, etc.)

  Exception _handleDioError(DioException e) {
    // Customize your error handling logic
    switch (e.type) {
      case DioExceptionType.badResponse:
      // Handle response errors
        return Exception('Received invalid status code: ${e.response?.statusCode}');
      case DioExceptionType.connectionTimeout:
        return Exception('Connection Timeout');
      case DioExceptionType.receiveTimeout:
        return Exception('Receive Timeout');
      case DioExceptionType.unknown:
        return Exception('Unexpected error: ${e.message}');
      default:
        return Exception('Unknown error');
    }
  }
}
