import 'package:get/get.dart';
import 'package:neumann_flutter/principal/publication/pub_service.dart';
import 'pub_response_model.dart';
import '../../services/authentication_manager.dart';

class PubController extends GetxController with StateMixin {
  late final PubService _pubService;
  AuthenticationManager am = AuthenticationManager();

  @override
  void onInit() {
    super.onInit();
    _pubService = Get.put(PubService());
  }

  Future<List<PubResponseModel>?> getAllPubs() async {
    String? token = am.retrieveToken();
    final response = await _pubService.fetchPubs(token);
    return response;
  }
}
