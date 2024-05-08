import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
class AuthDto with _$AuthDto {
  factory AuthDto({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _AuthDto;

  factory AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);
}
