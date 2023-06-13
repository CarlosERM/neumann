import 'package:get/get.dart';
import 'package:neumann_flutter/principal/publication/pub_service.dart';
import 'pub_response_model.dart';
import '../../services/authentication_manager.dart';

class PubController extends GetxController with StateMixin {
  late final PubService _pubService;
  AuthenticationManager am = AuthenticationManager();
  late RxList<PubResponseModel> publications = <PubResponseModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    _pubService = Get.put(PubService());
  }

  Future<List> getAllPubs() async {
    String? token = am.retrieveToken();
    publications.value = await _pubService.fetchPubs(token);
    publications.refresh();
    return publications.value;
  }
}
