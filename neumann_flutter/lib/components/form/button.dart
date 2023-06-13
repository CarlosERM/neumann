import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../edit_profile/edit_profile_controller.dart';
import '../../research_projects/research_projects_controller.dart';
import 'description_input/description_input_controller.dart';
import 'email_input/email_input_controller.dart';
import 'name_input/name_input_controller.dart';
import '../../register/register_controller.dart';
import '../../login/login_controller.dart';
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
  DescriptionInputController dic = Get.put(DescriptionInputController());
  late String? message;
  final PasswordInputController ip = Get.put(PasswordInputController());
  final ResearchProjectsController rpc = Get.put(ResearchProjectsController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () async {
        if (formKey.currentState!.validate() && route.isNotEmpty) {
          if (name == 'Registrar') {
            rc.registerUser(
              nic.nameController.text,
              ie.emailController.text,
              ip.passwordControllerOne.text,
            );
          } else if (name == 'Login') {
            message = await lc.loginUser(
              ie.emailController.text,
              ip.passwordControllerOne.text,
            );
            if (message!.isNotEmpty) {
              Get.showSnackbar(
                GetSnackBar(
                  titleText: Text("Login",
                      style: Theme.of(context).textTheme.labelLarge),
                  messageText: Text(message!,
                      style: Theme.of(context).textTheme.bodySmall),
                  duration: const Duration(seconds: 3),
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  margin: const EdgeInsets.all(12.0),
                ),
              );
            }
          } else if (name == 'Salvar') {
            message = await epc.editProfile();
            Get.showSnackbar(
              GetSnackBar(
                titleText: Text("Editar perfil",
                    style: Theme.of(context).textTheme.labelLarge),
                messageText: Text(message!,
                    style: Theme.of(context).textTheme.bodySmall),
                duration: const Duration(seconds: 3),
                snackPosition: SnackPosition.TOP,
                backgroundColor: Theme.of(context).colorScheme.background,
                boxShadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                margin: const EdgeInsets.all(12.0),
              ),
            );
          } else if (name == 'Cadastrar Projeto') {
            message = await rpc.createProject(
                nic.nameController.text, dic.descriptionController.text, []);
            Get.showSnackbar(
              GetSnackBar(
                titleText: Text("Criar projeto",
                    style: Theme.of(context).textTheme.labelLarge),
                messageText: Text(message!,
                    style: Theme.of(context).textTheme.bodySmall),
                duration: const Duration(seconds: 3),
                snackPosition: SnackPosition.TOP,
                backgroundColor: Theme.of(context).colorScheme.background,
                boxShadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                margin: const EdgeInsets.all(12.0),
              ),
            );
          } else if (name == 'Editar projeto') {
            message = await rpc.updateProject(
                nic.nameController.text, dic.descriptionController.text, []);
            Get.showSnackbar(
              GetSnackBar(
                titleText: Text("Editar projeto",
                    style: Theme.of(context).textTheme.labelLarge),
                messageText: Text(message!,
                    style: Theme.of(context).textTheme.bodySmall),
                duration: const Duration(seconds: 3),
                snackPosition: SnackPosition.TOP,
                backgroundColor: Theme.of(context).colorScheme.background,
                boxShadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                margin: const EdgeInsets.all(12.0),
              ),
            );
          }
        }
        // Get.toNamed(Routes.principal);
      },
      child: Text(name),
    );
  }
}
