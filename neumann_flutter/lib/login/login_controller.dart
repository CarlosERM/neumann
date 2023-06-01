import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/login/login_request_model.dart';
import '../services/authentication_manager.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.put(AuthenticationManager());
  }

  Future<void> loginUser(String email, String senha) async {
    loading.value = true;
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, senha: senha));

    if (response != null) {
      /// Seta o isLogin para verdadeiro.
      _authManager.login(
          response.user.token, response.user.id, response.user.nome);
    } else {
      /// Mostra um diálogo sobre a resposta de erro.
      Get.defaultDialog(
          middleText: 'Erro no login.',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    loading.value = false;
  }
}
