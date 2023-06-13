// To parse this JSON data, do
//
//     final updateProjectRequestModel = updateProjectRequestModelFromJson(jsonString);

import 'dart:convert';

import '../../participante_model.dart';

UpdateProjectRequestModel updateProjectRequestModelFromJson(String str) =>
    UpdateProjectRequestModel.fromJson(json.decode(str));

String updateProjectRequestModelToJson(UpdateProjectRequestModel data) =>
    json.encode(data.toJson());

class UpdateProjectRequestModel {
  String nome;
  String descricao;
  List<Participante> participantes;

  UpdateProjectRequestModel({
    required this.nome,
    required this.descricao,
    required this.participantes,
  });

  factory UpdateProjectRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateProjectRequestModel(
        nome: json["nome"],
        descricao: json["descricao"],
        participantes: List<Participante>.from(
            json["participantes"].map((x) => Participante.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "descricao": descricao,
        "participantes":
            List<dynamic>.from(participantes.map((x) => x.toJson())),
      };
}
