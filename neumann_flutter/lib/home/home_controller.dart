import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../principal/publication/pub_controller.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  String nome = '';
  late PubController pc;

  @override
  void onInit() {
    super.onInit();
  }

  Future<String> getUsername() async {
    nome = await box.read('nome');

    return nome;
  }
}
