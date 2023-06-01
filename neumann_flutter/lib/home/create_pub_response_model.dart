// To parse this JSON data, do
//
//     final createPubResponseModel = createPubResponseModelFromJson(jsonString);

import 'dart:convert';

CreatePubResponseModel createPubResponseModelFromJson(String str) =>
    CreatePubResponseModel.fromJson(json.decode(str));

String createPubResponseModelToJson(CreatePubResponseModel data) =>
    json.encode(data.toJson());

class CreatePubResponseModel {
  String message;

  CreatePubResponseModel({
    required this.message,
  });

  factory CreatePubResponseModel.fromJson(Map<String, dynamic> json) =>
      CreatePubResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
