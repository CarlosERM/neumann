// To parse this JSON data, do
//
//     final changePasswordRequest = changePasswordRequestFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequest changePasswordRequestFromJson(String str) =>
    ChangePasswordRequest.fromJson(json.decode(str));

String changePasswordRequestToJson(ChangePasswordRequest data) =>
    json.encode(data.toJson());

class ChangePasswordRequest {
  String senha;

  ChangePasswordRequest({
    required this.senha,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequest(
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "senha": senha,
      };
}
