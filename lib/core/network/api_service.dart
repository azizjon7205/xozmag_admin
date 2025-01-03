import 'dart:convert';
import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '/features/auth/domain/entities/auth_success.dart';
import '/shared/data/data_sources/local/app_shared_prefs.dart';
import '/shared/models/api_response.dart';
import '../helper/helper.dart';
import '../utils/log/app_logger.dart';
import 'logger_interceptor.dart';

class ApiService {
  final Dio _dio;
  final AppSharedPrefs _sharedPrefs;

  ApiService({required String baseUrl, required AppSharedPrefs sharedPrefs})
      : _sharedPrefs = sharedPrefs,
        _dio = Dio(
          BaseOptions(baseUrl: baseUrl),
        ) {
    _dio.interceptors.add(ChuckerDioInterceptor());
    _dio.interceptors.add(_loggerInterceptor());
    _dio.interceptors.add(_appQueuedInterceptorsWrapper());
    _dio.interceptors.add(_interceptorsWrapper());
  }

  Future<T> get<T>(
      String path, {
        required Function tFromJson,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data != null) {
        final result = ApiResponse<T>.fromJson(
          response.data,
          tFromJson,
        );
        if (result.data != null) {
          return result.data!;
        } else {
          throw result.error ?? Exception('Something went wrong');
        }
      } else {
        throw Exception('Network Error: ${response.statusMessage}');
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  Future<T> post<T>(
      String path, {
        required Function tFromJson,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data != null) {
        final result = ApiResponse<T>.fromJson(
          response.data,
          tFromJson,
        );
        if (result.data != null) {
          return result.data!;
        } else {
          throw result.error ?? Exception('Something went wrong');
        }
      } else {
        throw Exception('Network Error: ${response.statusMessage}');
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  Future<T> put<T>(
      String path, {
        required Function tFromJson,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data != null) {
        final result = ApiResponse<T>.fromJson(
          response.data,
          tFromJson,
        );
        if (result.data != null) {
          return result.data!;
        } else {
          throw result.error ?? Exception('Something went wrong');
        }
      } else {
        throw Exception('Network Error: ${response.statusMessage}');
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  Future<T> patch<T>(
      String path, {
        required Function tFromJson,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data != null) {
        final result = ApiResponse<T>.fromJson(
          response.data,
          tFromJson,
        );
        if (result.data != null) {
          return result.data!;
        } else {
          throw result.error ?? Exception('Something went wrong');
        }
      } else {
        throw Exception('Network Error: ${response.statusMessage}');
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  Future<T> delete<T>(
      String path, {
        required Function tFromJson,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.data != null) {
        final result = ApiResponse<T>.fromJson(
          response.data,
          tFromJson,
        );
        if (result.data != null) {
          return result.data!;
        } else {
          throw result.error ?? Exception('Something went wrong');
        }
      } else {
        throw Exception('Network Error: ${response.statusMessage}');
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  // Error Handling
  void _handleError(Object error) {
    if (error is DioException) {
      // Map Dio errors to user-friendly messages
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception('Connection Timeout');
        case DioExceptionType.receiveTimeout:
          throw Exception('Receive Timeout');
        case DioExceptionType.badResponse:
          debugPrint('Server Error: ${error.response?.data}');
          throw Exception('Server Error: ${error.response?.data['message']}');
        case DioExceptionType.connectionError:
          throw Exception('Network Error: ${error.message}');
        default:
          throw Exception('Unexpected Error: ${error.message}');
      }
    } else {
      throw Exception('Unexpected Error: $error');
    }
  }

  LoggerInterceptor _loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  ///__________App__________///

  /// App Api Queued Interceptor
  QueuedInterceptorsWrapper _appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = await Helper.getHeaders();

        if (options.uri.path.contains('/mobile/auth/refresh')) {
          headers.remove('authorization');
        }

        if (kDebugMode) {
          print("Headers");
          print(json.encode(headers));
          print('REQUEST URI ${options.uri}');
        }

        options.headers = headers;
        return r.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401 &&
            _sharedPrefs.getAuthToken() != null) {
          try {
            final response = await _dio.post('/api/v1/auth/refresh-token', data: {
              'refresh_token': _sharedPrefs.getRefreshToken(),
            });
            if (response.statusCode == 200) {
              final result = ApiResponse<AuthSuccess>.fromJson(
                response.data,
                AuthSuccess.fromJson,
              );
              if (result.success ?? false) {
                e.requestOptions.headers[HttpHeaders.authorizationHeader] =
                    'Bearer ${result.data!.token}';
                _sharedPrefs.setAuthToken(result.data!.token);
                _sharedPrefs.setRefreshToken(result.data!.refreshToken);
                return handler.resolve(await _dio.fetch(e.requestOptions));
              } else {
                return handler.next(e);
              }
            } else {
              return handler.next(e);
            }
          } catch (_) {
            return handler.next(e);
          }
        }
        return handler.next(e);
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler handler) async {
        return handler.next(response);
      },
    );
  }

  /// App interceptor
  InterceptorsWrapper _interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = await Helper.getHeaders();

        if (options.uri.path.contains('/mobile/auth/refresh')) {
          headers.remove('authorization');
        }

        options.headers = headers;
        _dio.options.headers = headers;

        return r.next(options);
      },
      onResponse: (response, handler) async {
        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
          // return handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: response, type: DioErrorType.response));
        } else {
          return handler.next(response);
        }
      },
      onError: (error, handler) {
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
    );
  }
}
