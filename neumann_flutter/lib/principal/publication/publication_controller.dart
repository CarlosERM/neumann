import 'package:get/get.dart';

import '../../home/message_controller.dart';

class PublicationController extends GetxController {
  final like = false.obs;
  MessageController mc = Get.put(MessageController());

  Future<void> editPub(String id, String conteudo) async {
    mc.editarPub = true;
    mc.tec.text = conteudo;
    mc.id = id;
  }
}
