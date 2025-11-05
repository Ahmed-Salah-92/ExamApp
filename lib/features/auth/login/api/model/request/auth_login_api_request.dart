import 'package:json_annotation/json_annotation.dart';

part 'auth_login_api_request.g.dart';

@JsonSerializable()
class AuthLoginApiRequest {
  final String email;
  final String password;

  const AuthLoginApiRequest({required this.email, required this.password});

  factory AuthLoginApiRequest.fromJson(Map<String, dynamic> json) {
    return _$AuthLoginApiRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthLoginApiRequestToJson(this);
}
