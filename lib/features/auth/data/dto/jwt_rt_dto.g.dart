// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_rt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtRtDto _$JwtRtDtoFromJson(Map<String, dynamic> json) => JwtRtDto(
  jwt: json['jwt'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$JwtRtDtoToJson(JwtRtDto instance) => <String, dynamic>{
  'jwt': instance.jwt,
  'refresh_token': instance.refreshToken,
};
