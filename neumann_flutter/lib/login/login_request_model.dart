import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String email;
  String senha;

  LoginRequestModel({
    required this.email,
    required this.senha,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        email: json["email"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "senha": senha,
      };
}
