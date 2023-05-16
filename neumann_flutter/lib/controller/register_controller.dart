import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/register_service.dart';
import '../view/login_register_flow/authentication_manager.dart';
import '../model/register_request_model.dart';

class RegisterController extends GetxController {
  late final RegisterService _registerService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _registerService = Get.put(RegisterService());
    _authManager = Get.put(AuthenticationManager());
  }

  Future<void> registerUser(String nome, String email, String senha) async {
    final response = await _registerService.fetchRegister(
        RegisterRequestModel(nome: nome, email: email, senha: senha));

    if (response != null) {
      /// Seta o isLogin para verdadeiro.
      _authManager.login(response.token);
    } else {
      /// Mostra um diálogo sobre a resposta de erro.
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
