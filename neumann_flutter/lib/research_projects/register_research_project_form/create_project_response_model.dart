// To parse this JSON data, do
//
//     final createProjectResponseModel = createProjectResponseModelFromJson(jsonString);

import 'dart:convert';

CreateProjectResponseModel createProjectResponseModelFromJson(String str) =>
    CreateProjectResponseModel.fromJson(json.decode(str));

String createProjectResponseModelToJson(CreateProjectResponseModel data) =>
    json.encode(data.toJson());

class CreateProjectResponseModel {
  String message;

  CreateProjectResponseModel({
    required this.message,
  });

  factory CreateProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateProjectResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
