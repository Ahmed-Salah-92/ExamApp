import '../../data/model/response/user_dto.dart';

class LoginResponseModel {
  final String? message;
  // final int? code;
  final String? token;
  final UserDto? userData;

  LoginResponseModel({this.message,this.token, this.userData});
}
