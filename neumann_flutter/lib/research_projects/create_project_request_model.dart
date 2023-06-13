// To parse this JSON data, do
//
//     final createProjectRequestModel = createProjectRequestModelFromJson(jsonString);

import 'dart:convert';

CreateProjectRequestModel createProjectRequestModelFromJson(String str) =>
    CreateProjectRequestModel.fromJson(json.decode(str));

String createProjectRequestModelToJson(CreateProjectRequestModel data) =>
    json.encode(data.toJson());

class CreateProjectRequestModel {
  String nome;
  String descricao;
  List<Participante> participantes;

  CreateProjectRequestModel({
    required this.nome,
    required this.descricao,
    required this.participantes,
  });

  factory CreateProjectRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateProjectRequestModel(
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

class Participante {
  String participante;

  Participante({
    required this.participante,
  });

  factory Participante.fromJson(Map<String, dynamic> json) => Participante(
        participante: json["participante"],
      );

  Map<String, dynamic> toJson() => {
        "participante": participante,
      };
}
