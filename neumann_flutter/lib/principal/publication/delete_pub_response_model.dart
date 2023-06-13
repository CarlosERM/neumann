// To parse this JSON data, do
//
//     final deletePubResponseModel = deletePubResponseModelFromJson(jsonString);

import 'dart:convert';

DeletePubResponseModel deletePubResponseModelFromJson(String str) =>
    DeletePubResponseModel.fromJson(json.decode(str));

String deletePubResponseModelToJson(DeletePubResponseModel data) =>
    json.encode(data.toJson());

class DeletePubResponseModel {
  String msg;

  DeletePubResponseModel({
    required this.msg,
  });

  factory DeletePubResponseModel.fromJson(Map<String, dynamic> json) =>
      DeletePubResponseModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
