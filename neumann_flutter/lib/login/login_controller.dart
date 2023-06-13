import 'package:get/get.dart';
import 'package:neumann_flutter/login/login_request_model.dart';
import '../services/authentication_manager.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.put(AuthenticationManager());
  }

  Future<String?> loginUser(String email, String senha) async {
    loading.value = true;
    loading.refresh();
    final response = await _loginService.fetchLogin(
      LoginRequestModel(
        email: email,
        senha: senha,
      ),
    );

    if (response != null) {
      /// Seta o isLogin para verdadeiro.
      _authManager.login(
        response.user.token,
        response.user.id,
        response.user.nome,
        response.user.email,
      );
      loading.value = false;
      loading.refresh();

      return response.msg;
    } else {
      loading.value = false;
      loading.refresh();

      return "Não foi possível entrar em contato com o servidor.";
    }
  }
}
