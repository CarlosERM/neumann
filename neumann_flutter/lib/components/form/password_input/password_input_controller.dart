import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordInputController extends GetxController {
  final estado = true.obs;
  final passwordControllerOne = TextEditingController();
  final passwordControllerSecond = TextEditingController();

  bool validatePassword(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  bool passwordIsEqual() {
    if (passwordControllerOne.text == passwordControllerSecond.text) {
      return true;
    }
    return false;
  }
}
