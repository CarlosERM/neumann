import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../edit_profile/edit_profile_controller.dart';
import 'email_input/email_input_controller.dart';
import 'name_input/name_input_controller.dart';
import '../../register/register_controller.dart';
import '../../login/login_controller.dart';
import '../../util/routes.dart';
import 'password_input/password_input_controller.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.formKey,
    required this.name,
    required this.route,
  });
  final GlobalKey<FormState> formKey;
  final String name;
  final String route;
  final RegisterController rc = Get.put(RegisterController());
  final LoginController lc = Get.put(LoginController());
  final EditProfileController epc = Get.put(EditProfileController());

  final NameInputController nic = Get.put(
    NameInputController(),
  );
  final EmailInputController ie = Get.put(
    EmailInputController(),
  );
  final PasswordInputController ip = Get.put(PasswordInputController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () {
        if (formKey.currentState!.validate() && route.isNotEmpty) {
          if (name == 'Registrar') {
            rc.registerUser(
              nic.nameController.text,
              ie.emailController.text,
              ip.passwordControllerOne.text,
            );
          } else if (name == 'Login') {
            lc.loginUser(
              ie.emailController.text,
              ip.passwordControllerOne.text,
            );
          } else if (name == 'Salvar') {
            epc.editProfile();
          } else if (name == 'Salvar') {
            epc.editProfile();
          }
          print(name);
        }
        // Get.toNamed(Routes.principal);
      },
      child: Text(name),
    );
  }
}
