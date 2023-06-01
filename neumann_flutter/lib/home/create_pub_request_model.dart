// To parse this JSON data, do
//
//     final createPubRequestModel = createPubRequestModelFromJson(jsonString);

import 'dart:convert';

CreatePubRequestModel createPubRequestModelFromJson(String str) =>
    CreatePubRequestModel.fromJson(json.decode(str));

String createPubRequestModelToJson(CreatePubRequestModel data) =>
    json.encode(data.toJson());

class CreatePubRequestModel {
  String conteudo;
  String autor;

  CreatePubRequestModel({
    required this.conteudo,
    required this.autor,
  });

  factory CreatePubRequestModel.fromJson(Map<String, dynamic> json) =>
      CreatePubRequestModel(
        conteudo: json["conteudo"],
        autor: json["autor"],
      );

  Map<String, dynamic> toJson() => {
        "conteudo": conteudo,
        "autor": autor,
      };
}
