import 'dart:ffi';

import 'package:get/get.dart';
import 'package:neumann_flutter/principal/publication/pub_service.dart';
import 'pub_response_model.dart';
import '../../services/authentication_manager.dart';

class PubController extends GetxController with StateMixin {
  late final PubService _pubService;
  AuthenticationManager am = AuthenticationManager();
  late RxList<PubResponseModel> publications = <PubResponseModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    _pubService = Get.put(PubService());
    await getAllPubs();
  }

  getAllPubs() async {
    String? token = am.retrieveToken();
    var response = await _pubService.fetchPubs(token);
    publications.assignAll(response);
  }
}
