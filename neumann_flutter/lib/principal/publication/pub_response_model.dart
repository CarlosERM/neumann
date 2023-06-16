// To parse this JSON data, do
//
//     final pubResponseModel = pubResponseModelFromJson(jsonString);

import 'dart:convert';

List<PubResponseModel> pubResponseModelFromJson(String str) =>
    List<PubResponseModel>.from(
        json.decode(str).map((x) => PubResponseModel.fromJson(x)));

String pubResponseModelToJson(List<PubResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PubResponseModel {
  String id;
  String conteudo;
  String autor;
  DateTime date;
  int v;

  PubResponseModel({
    required this.id,
    required this.conteudo,
    required this.autor,
    required this.date,
    required this.v,
  });

  factory PubResponseModel.fromJson(Map<String, dynamic> json) =>
      PubResponseModel(
        id: json["_id"],
        conteudo: json["conteudo"],
        autor: json["autor"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "conteudo": conteudo,
        "autor": autor,
        "date": date.toIso8601String(),
        "__v": v,
      };
}
