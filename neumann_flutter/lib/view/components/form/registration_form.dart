import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/name_input.dart';
import 'package:neumann_flutter/view/components/form/password_input.dart';
import 'package:neumann_flutter/view/components/form/profile_picture.dart';
import '../../../controller/image_controller.dart';
import '../../../controller/password_input_controller.dart';
import 'email_input.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tec1 = TextEditingController();
  final TextEditingController tec2 = TextEditingController();

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
          PasswordInput(),
          const SizedBox(height: 30),
          PasswordInput(),
          const SizedBox(height: 40),
          Button(formKey: _formKey, name: "Registrar"),
        ],
      ),
    );
  }
}
