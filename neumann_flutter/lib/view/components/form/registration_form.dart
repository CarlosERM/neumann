import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/util/routes.dart';
import '../../../controller/password_input_controller.dart';
import 'button.dart';
import 'email_input.dart';
import 'name_input.dart';
import 'password_input.dart';
import 'profile_picture.dart';
import '../../../controller/register_controller.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final RegisterController rc = Get.put(RegisterController());
  final PasswordInputController ip = Get.put(PasswordInputController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Crie sua conta",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text.rich(
            TextSpan(
              text: "Já possui uma conta?",
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: " Login",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          ProfilePicture(),
          const SizedBox(height: 40),
          NameInput(),
          const SizedBox(height: 16),
          EmailInput(),
          const SizedBox(height: 16),
          PasswordInput(tec: ip.passwordControllerOne),
          const SizedBox(height: 30),
          PasswordInput(tec: ip.passwordControllerSecond),
          const SizedBox(height: 40),
          Button(formKey: _formKey, name: "Registrar", route: Routes.principal),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
