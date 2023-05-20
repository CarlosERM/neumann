import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:neumann_flutter/principal/publication/pub_response_model.dart';

class PubService extends GetConnect {
  final String pubUrl =
      "${dotenv.get('URL', fallback: 'API_URL not found')}pub/";
  Future<List<PubResponseModel>> fetchPubs(String? token) async {
    final response = await get(pubUrl, headers: {
      "Authorization": token!,
    });

    if (response.statusCode == HttpStatus.ok) {
      List<PubResponseModel> result = [];
      (response.body).forEach((element) {
        result.add(PubResponseModel.fromJson(element));
      });
      return result;
    } else {
      List<PubResponseModel> result = [];
      return result;
    }
  }
}
