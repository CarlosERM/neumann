// To parse this JSON data, do
//
//     final editProfileResponseModel = editProfileResponseModelFromJson(jsonString);

import 'dart:convert';

EditProfileResponseModel editProfileResponseModelFromJson(String str) =>
    EditProfileResponseModel.fromJson(json.decode(str));

String editProfileResponseModelToJson(EditProfileResponseModel data) =>
    json.encode(data.toJson());

class EditProfileResponseModel {
  String id;
  Person person;

  EditProfileResponseModel({
    required this.id,
    required this.person,
  });

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      EditProfileResponseModel(
        id: json["id"],
        person: Person.fromJson(json["person"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "person": person.toJson(),
      };
}

class Person {
  String nome;
  String email;

  Person({
    required this.nome,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        nome: json["nome"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
      };
}
