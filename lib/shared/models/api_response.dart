import 'package:flutter/foundation.dart';

import 'app_error.dart';

class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.data,
    required this.error,
    required this.status,
    required this.message,
  });

  final bool? success;
  final T? data;
  final AppError? error;
  final dynamic status;
  final String? message;

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, Function dataFromJson) =>
      ApiResponse(
        message: json['message'],
        status: json['status'],
        success: json["success"],
        data: json["data"] != null ? dataFromJson(json["data"]) : null,
        error: json["error"] != null
            ? json['error'] == null
                ? AppError()
                : json["error"] is String
                    ? AppError(message: json['error'])
                    : AppError.fromJson(json["error"])
            : null,
      );

  const ApiResponse.success(T data, [String message = ''])
      : this(
          message: message,
          status: 200,
          success: true,
          data: data,
          error: null,
        );

  const ApiResponse.error(AppError error, [String message = ''])
      : this(
          message: message,
          status: 0,
          success: false,
          data: null,
          error: error,
        );

  Map<String, dynamic> toJson(Function(T? data) dataToJson) => {
        "success": success,
        "data": dataToJson(data),
        "error": error?.toJson(),
        'message': message,
        'status': status,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiResponse) {
      return other.data is List
          ? listEquals(other.data, data as List)
          : other.data == data;
    }

    return false;
  }
}
