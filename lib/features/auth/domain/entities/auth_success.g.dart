// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSuccess _$AuthSuccessFromJson(Map<String, dynamic> json) => AuthSuccess(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthSuccessToJson(AuthSuccess instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
