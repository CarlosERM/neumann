// To parse this JSON data, do
//
//     final updateProjectResponseModel = updateProjectResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateProjectResponseModel updateProjectResponseModelFromJson(String str) =>
    UpdateProjectResponseModel.fromJson(json.decode(str));

String updateProjectResponseModelToJson(UpdateProjectResponseModel data) =>
    json.encode(data.toJson());

class UpdateProjectResponseModel {
  String msg;

  UpdateProjectResponseModel({
    required this.msg,
  });

  factory UpdateProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProjectResponseModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
