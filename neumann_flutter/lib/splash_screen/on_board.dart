import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/login.dart';
import '../principal/principal.dart';
import '../services/authentication_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? Principal() : const Login();
    });
  }
}
