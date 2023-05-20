// To parse this JSON data, do
//
//     final pubResponseModel = pubResponseModelFromJson(jsonString);

import 'dart:convert';

PubResponseModel pubResponseModelFromJson(String str) =>
    PubResponseModel.fromJson(json.decode(str));

String pubResponseModelToJson(PubResponseModel data) =>
    json.encode(data.toJson());

class PubResponseModel {
  String id;
  String titulo;
  String conteudo;
  String autor;
  int v;

  PubResponseModel({
    required this.id,
    required this.titulo,
    required this.conteudo,
    required this.autor,
    required this.v,
  });

  factory PubResponseModel.fromJson(Map<String, dynamic> json) =>
      PubResponseModel(
        id: json["_id"],
        titulo: json["titulo"],
        conteudo: json["conteudo"],
        autor: json["autor"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "titulo": titulo,
        "conteudo": conteudo,
        "autor": autor,
        "__v": v,
      };
}
