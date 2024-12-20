import 'dart:convert';
import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xozmag_admin/shared/models/app_error.dart';

import '../../features/auth/domain/entities/auth_success.dart';
import '../../shared/data/data_sources/local/app_shared_prefs.dart';
import '../../shared/models/api_response.dart';
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

  // GET request
  Future<ApiResponse<T>> get<T>(
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
        return result;
      } else {
        throw AppError(message: "Something went wrong");
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    required Function tFromJson,
    Object? data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final result = ApiResponse<T>.fromJson(
        response.data,
        tFromJson,
      );

      if (result.success == true) {
        return result;
      } else {
        throw result.error ?? AppError(message: "Something went wrong");
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse<T>> put<T>(
    String path, {
    required Function tFromJson,
    Object? data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final result = ApiResponse<T>.fromJson(
        response.data,
        tFromJson,
      );

      if (result.success == true) {
        return result;
      } else {
        throw result.error ?? AppError(message: "Something went wrong");
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse<T>> patch<T>(
    String path, {
    required Function tFromJson,
    Object? data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final result = ApiResponse<T>.fromJson(
        response.data,
        tFromJson,
      );

      if (result.success == true) {
        return result;
      } else {
        throw result.error ?? AppError(message: "Something went wrong");
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String path, {
    required Function tFromJson,
    Object? data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      final result = ApiResponse<T>.fromJson(
        response.data,
        tFromJson,
      );

      if (result.success == true) {
        return result;
      } else {
        throw result.error ?? AppError(message: "Something went wrong");
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Error Handling
  Exception _handleError(DioException error) {
    if (error.response != null) {
      // Server-side error
      return AppError(
          message: 'Server Error: ${error.response?.data['message']}');
    } else {
      // Client-side error
      return AppError(message: 'Network Error: ${error.message}');
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
            final response = await _dio.post('/mobile/auth/refresh', data: {
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
