import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_entity.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    required String accessToken,
    required String refreshToken,
  }) = _AuthReposponse;
}
