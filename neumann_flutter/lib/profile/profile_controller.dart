import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  String nome = '';
  Future<String> getUsername() async {
    nome = await box.read('nome');
    return nome;
  }
}
