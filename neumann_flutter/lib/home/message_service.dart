import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/home/create_pub_request_model.dart';
import 'package:neumann_flutter/home/create_pub_response_model.dart';

class MessageService extends GetConnect {
  final box = GetStorage();
  final String pubUrl =
      "${dotenv.get('URL', fallback: 'API_URL not found')}pub/";

  Future<CreatePubResponseModel?> createPub(
      CreatePubRequestModel model, token) async {
    final response = await post(pubUrl, model.toJson(), headers: {
      "Authorization": token!,
    });
    if (response.statusCode == HttpStatus.ok) {
      return CreatePubResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
