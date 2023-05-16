import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String msg;
  String token;

  LoginResponseModel({
    required this.msg,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        msg: json["msg"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "token": token,
      };
}
