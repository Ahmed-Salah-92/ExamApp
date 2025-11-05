import 'package:exam_app/features/auth/login/domain/model/user_model.dart';

import '../../data/model/response/user_dto.dart';

class LoginResponseModel {
  final String? message;
  // final int? code;
  final String? token;
  final UserModel? userData;

  LoginResponseModel({this.message,this.token, this.userData});
}
