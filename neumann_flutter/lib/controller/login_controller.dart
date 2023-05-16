import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/model/login_request_model.dart';
import 'package:neumann_flutter/services/login_service.dart';
import '../view/login_register_flow/authentication_manager.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.put(AuthenticationManager());
  }

  Future<void> loginUser(String email, String senha) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, senha: senha));

    if (response != null) {
      /// Seta o isLogin para verdadeiro.
      _authManager.login(response.token);
    } else {
      /// Mostra um diálogo sobre a resposta de erro.
      Get.defaultDialog(
          middleText: 'Login Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
