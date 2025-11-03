import 'dart:convert';

import 'package:exam_app/features/auth/login/domain/model/login_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../data/model/response/user_dto.dart';

part 'auth_login_api_response.g.dart';

@JsonSerializable()
class AuthLoginApiResponse {
  @JsonKey(name: "message")
  String? message;
  // @JsonKey(name: "code")
  // int? code;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserDto? userDto;

  AuthLoginApiResponse({this.message, this.token, this.userDto});

  factory AuthLoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginApiResponseToJson(this);

  LoginResponseModel toDomain() => LoginResponseModel(
    message: message ?? '',
    // code: code ?? 200,
    token: token ?? '',
    userData:
        userDto ??
        UserDto(
          id: '',
          username: '',
          firstName: '',
          lastName: '',
          email: '',
          phone: '',
          role: '',
          isVerified: false,
          createdAt: DateTime.now(),
        ),
  );

  /// Helper method to format DateTime to local (not used currently)
  // DateTime _dateTimeFormat(DateTime dateTime) {
  //   return DateTime(
  //     dateTime.year,
  //     dateTime.month,
  //     dateTime.day,
  //     dateTime.hour,
  //     dateTime.minute,
  //     dateTime.second,
  //   ).toLocal();
  // }
}
