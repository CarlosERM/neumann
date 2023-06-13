class Participante {
  String participante;
  String id;

  Participante({
    required this.participante,
    required this.id,
  });

  factory Participante.fromJson(Map<String, dynamic> json) => Participante(
        participante: json["participante"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "participante": participante,
        "_id": id,
      };
}
