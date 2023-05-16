import 'package:get/get.dart';
import 'package:neumann_flutter/util/routes.dart';
import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
    Get.toNamed(Routes.login);
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
    Get.deleteAll();
    Get.toNamed(Routes.principal);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
