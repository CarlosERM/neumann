// To parse this JSON data, do
//
//     final updatePubRequestModel = updatePubRequestModelFromJson(jsonString);

import 'dart:convert';

UpdatePubRequestModel updatePubRequestModelFromJson(String str) =>
    UpdatePubRequestModel.fromJson(json.decode(str));

String updatePubRequestModelToJson(UpdatePubRequestModel data) =>
    json.encode(data.toJson());

class UpdatePubRequestModel {
  String conteudo;

  UpdatePubRequestModel({
    required this.conteudo,
  });

  factory UpdatePubRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdatePubRequestModel(
        conteudo: json["conteudo"],
      );

  Map<String, dynamic> toJson() => {
        "conteudo": conteudo,
      };
}
