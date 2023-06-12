// To parse this JSON data, do
//
//     final updatePubResponseModel = updatePubResponseModelFromJson(jsonString);

import 'dart:convert';

UpdatePubResponseModel updatePubResponseModelFromJson(String str) =>
    UpdatePubResponseModel.fromJson(json.decode(str));

String updatePubResponseModelToJson(UpdatePubResponseModel data) =>
    json.encode(data.toJson());

class UpdatePubResponseModel {
  String msg;
  Pub pub;

  UpdatePubResponseModel({
    required this.msg,
    required this.pub,
  });

  factory UpdatePubResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdatePubResponseModel(
        msg: json["msg"],
        pub: Pub.fromJson(json["pub"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "pub": pub.toJson(),
      };
}

class Pub {
  String id;
  String conteudo;
  String autor;
  int v;

  Pub({
    required this.id,
    required this.conteudo,
    required this.autor,
    required this.v,
  });

  factory Pub.fromJson(Map<String, dynamic> json) => Pub(
        id: json["_id"],
        conteudo: json["conteudo"],
        autor: json["autor"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "conteudo": conteudo,
        "autor": autor,
        "__v": v,
      };
}
