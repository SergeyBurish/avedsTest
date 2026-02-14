import 'package:aveds_test/features/auth/domain/entity/user_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto extends UserProfile {
  @override
  @JsonKey(name: 'user_id')
  String get userId;

  UserProfileDto({
    required super.userId,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) => _$UserProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
}