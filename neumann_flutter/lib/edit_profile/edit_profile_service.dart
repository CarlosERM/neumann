import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/edit_profile/change_password_request.dart';
import 'package:neumann_flutter/edit_profile/edit_profile_request_model.dart';
import 'package:neumann_flutter/edit_profile/edit_profile_response_model.dart';

class EditProfileService extends GetConnect {
  final box = GetStorage();
  late String userID;
  final String pubUrl =
      "${dotenv.get('URL', fallback: 'API_URL not found')}person/";

  Future<EditProfileResponseModel?> patchUser(
      EditProfileRequestModel model, token) async {
    userID = await box.read('id');
    final response = await patch(pubUrl + userID, model.toJson(), headers: {
      "Authorization": token!,
    });
    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
      return EditProfileResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<EditProfileResponseModel?> passwordUser(
      ChangePasswordRequest model, token) async {
    userID = await box.read('id');
    final response = await patch(pubUrl + userID, model.toJson(), headers: {
      "Authorization": token!,
    });
    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
      return EditProfileResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
