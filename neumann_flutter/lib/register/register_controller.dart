import 'package:get/get.dart';
import 'package:neumann_flutter/components/modal/modal.dart';
import '../services/authentication_manager.dart';
import 'register_request_model.dart';
import 'register_service.dart';

class RegisterController extends GetxController with StateMixin {
  late final RegisterService _registerService;
  late final AuthenticationManager _authManager;
  @override
  void onInit() {
    super.onInit();
    _registerService = Get.put(RegisterService());
    _authManager = Get.put(AuthenticationManager());
  }

  Future<void> registerUser(String nome, String email, String senha) async {
    // Faz o status de Carregamento.~
    final response = await _registerService.fetchRegister(
        RegisterRequestModel(nome: nome, email: email, senha: senha));
    if (response != null) {
      /// Seta o isLogin para verdadeiro.
      _authManager.login(response.token, response.user.id, response.user.nome,
          response.user.email);
    } else {
      // Mostra um diálogo sobre a resposta de erro.
      Get.dialog(
        const Modal(
          title: "Registro",
          content: "Ocorreu algum erro durante o registro. Deseja sair?",
        ),
      );
    }
  }
}
