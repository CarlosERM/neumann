import 'package:get/get.dart';

class InputPasswordController extends GetxController {
  final estado = true.obs;

  bool validatePassword(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }
}
