// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginApiRequest _$AuthLoginApiRequestFromJson(Map<String, dynamic> json) =>
    AuthLoginApiRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthLoginApiRequestToJson(
  AuthLoginApiRequest instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
