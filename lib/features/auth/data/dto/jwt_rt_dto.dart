import 'package:aveds_test/features/auth/domain/entity/jwt_rt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jwt_rt_dto.g.dart';

@JsonSerializable()
class JwtRtDto extends JwtRt {
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  JwtRtDto({
    required super.jwt,
    required super.refreshToken,
  });

  factory JwtRtDto.fromJson(Map<String, dynamic> json) => _$JwtRtDtoFromJson(json);
  Map<String, dynamic> toJson() => _$JwtRtDtoToJson(this);
}