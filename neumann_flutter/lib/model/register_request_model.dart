// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) =>
    RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  String nome;
  String email;
  String senha;

  RegisterRequestModel({
    required this.nome,
    required this.email,
    required this.senha,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
        "senha": senha,
      };
}
