import 'package:json_annotation/json_annotation.dart';

part 'auth_success.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthSuccess {
  final String token;
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  AuthSuccess({
    required this.token,
    required this.refreshToken,
  });

  factory AuthSuccess.fromJson(Map<String, dynamic> json) =>
      _$AuthSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSuccessToJson(this);
}
