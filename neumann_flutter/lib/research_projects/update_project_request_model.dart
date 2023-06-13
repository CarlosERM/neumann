// To parse this JSON data, do
//
//     final updateProjectRequestModel = updateProjectRequestModelFromJson(jsonString);

import 'dart:convert';

UpdateProjectRequestModel updateProjectRequestModelFromJson(String str) =>
    UpdateProjectRequestModel.fromJson(json.decode(str));

String updateProjectRequestModelToJson(UpdateProjectRequestModel data) =>
    json.encode(data.toJson());

class UpdateProjectRequestModel {
  String nome;
  String descricao;

  UpdateProjectRequestModel({
    required this.nome,
    required this.descricao,
  });

  factory UpdateProjectRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateProjectRequestModel(
        nome: json["nome"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "descricao": descricao,
      };
}
