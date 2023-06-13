import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../home/message_controller.dart';
import '../../services/cache_manager.dart';
import 'delete_pub_response_model.dart';
import 'pub_controller.dart';
import 'pub_service.dart';

class PublicationController extends GetxController with CacheManager {
  late final PubService pubService;
  late final MessageController mc;
  final PubController pc = Get.put(PubController());

  final box = GetStorage();
  final like = false.obs;
  @override
  void onInit() {
    super.onInit();
    pubService = Get.put(PubService());
    mc = Get.put(MessageController());
  }

  Future<void> editPub(String id, String conteudo) async {
    mc.editarPub = true;
    mc.tec.text = conteudo;
    mc.id = id;
  }

  Future<String> deletePub(String id) async {
    final token = getToken();
    DeletePubResponseModel result =
        await pubService.deletePubService(token, id);
    await pc.getAllPubs();
    return result.msg;
  }
}
