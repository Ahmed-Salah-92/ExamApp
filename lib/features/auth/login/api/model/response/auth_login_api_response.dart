import 'package:json_annotation/json_annotation.dart';
import '../../../data/model/response/user_dto.dart';

part 'auth_login_api_response.g.dart';

@JsonSerializable()
class AuthLoginApiResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserDto? userDto;

  AuthLoginApiResponse({this.message, this.token, this.userDto});

  factory AuthLoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginApiResponseToJson(this);
}

