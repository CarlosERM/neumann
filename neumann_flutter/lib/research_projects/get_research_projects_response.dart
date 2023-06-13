// To parse this JSON data, do
//
//     final getResearchProjectsResponse = getResearchProjectsResponseFromJson(jsonString);

import 'dart:convert';

import '../participante_model.dart';

List<GetResearchProjectsResponse> getResearchProjectsResponseFromJson(
        String str) =>
    List<GetResearchProjectsResponse>.from(
        json.decode(str).map((x) => GetResearchProjectsResponse.fromJson(x)));

String getResearchProjectsResponseToJson(
        List<GetResearchProjectsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetResearchProjectsResponse {
  String id;
  String nome;
  String descricao;
  List<Participante> participantes;
  int v;

  GetResearchProjectsResponse({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.participantes,
    required this.v,
  });

  factory GetResearchProjectsResponse.fromJson(Map<String, dynamic> json) =>
      GetResearchProjectsResponse(
        id: json["_id"],
        nome: json["nome"],
        descricao: json["descricao"],
        participantes: List<Participante>.from(
            json["participantes"].map((x) => Participante.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nome": nome,
        "descricao": descricao,
        "participantes":
            List<dynamic>.from(participantes.map((x) => x.toJson())),
        "__v": v,
      };
}
