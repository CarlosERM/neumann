import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/edit_profile/edit_profile_service.dart';
import 'package:neumann_flutter/util/routes.dart';
import '../components/form/email_input/email_input_controller.dart';
import '../components/form/name_input/name_input_controller.dart';
import '../services/authentication_manager.dart';
import './edit_profile_request_model.dart';

class EditProfileController extends GetxController {
  late final NameInputController nic;
  late final EmailInputController eic;
  late final EditProfileService eps;
  AuthenticationManager am = AuthenticationManager();

  @override
  void onInit() {
    super.onInit();
    nic = Get.put(
      NameInputController(),
    );
    eic = Get.put(
      EmailInputController(),
    );
    eps = Get.put(
      EditProfileService(),
    );
  }

  final box = GetStorage();

  Future<void> getUsernameEmail() async {
    nic.nameController.text = await box.read('nome');
    eic.emailController.text = await box.read('email');
  }

  Future<String> editProfile() async {
    String? token = am.retrieveToken();

    final response = await eps.patchUser(
        EditProfileRequestModel(
          nome: nic.nameController.text,
          email: eic.emailController.text,
        ),
        token);
    if (response != null) {
      am.login(token, response.id, response.person.nome, response.person.email);
      Get.toNamed(Routes.principal);
      return "Atualização feita com sucesso!";
    } else {
      return "Ocorreu um erro durante a atualização.";
    }
  }
}
