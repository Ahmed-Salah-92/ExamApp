import 'package:json_annotation/json_annotation.dart';

part 'auth_login_request_dto.g.dart';

@JsonSerializable()
class AuthLoginRequestDto {
  final String email;
  final String password;

  const AuthLoginRequestDto({required this.email, required this.password});

  factory AuthLoginRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AuthLoginRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthLoginRequestDtoToJson(this);

}
