// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String msg;
  User user;

  LoginResponseModel({
    required this.msg,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        msg: json["msg"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "user": user.toJson(),
      };
}

class User {
  String id;
  String nome;
  String email;
  bool professor;
  String token;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.professor,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nome: json["nome"],
        email: json["email"],
        professor: json["professor"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "email": email,
        "professor": professor,
        "token": token,
      };
}
