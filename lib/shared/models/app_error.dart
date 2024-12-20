import 'package:json_annotation/json_annotation.dart';

part 'app_error.g.dart';

@JsonSerializable()
class AppError implements Exception {
  final String? message;
  final String? code;

  AppError({
    this.message,
    this.code,
  });

  @override
  String toString() => 'AppException: $message (Code: $code)';

  factory AppError.fromJson(Map<String, dynamic> json) =>
      _$AppErrorFromJson(json);

  Map<String, dynamic> toJson() => _$AppErrorToJson(this);
}
