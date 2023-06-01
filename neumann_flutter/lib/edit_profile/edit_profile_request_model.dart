import 'dart:convert';

EditProfileRequestModel editProfileRequestModelFromJson(String str) =>
    EditProfileRequestModel.fromJson(json.decode(str));

String editProfileRequestModelToJson(EditProfileRequestModel data) =>
    json.encode(data.toJson());

class EditProfileRequestModel {
  String nome;
  String email;

  EditProfileRequestModel({
    required this.nome,
    required this.email,
  });

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      EditProfileRequestModel(
        nome: json["nome"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
      };
}
