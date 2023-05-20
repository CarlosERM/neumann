import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/routes.dart';
import 'button.dart';
import 'email_input/email_input.dart';
import 'password_input/password_input.dart';
import 'password_input/password_input_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController tec = TextEditingController();
  final PasswordInputController ip = Get.put(PasswordInputController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EmailInput(),
            const SizedBox(height: 18),
            PasswordInput(tec: ip.passwordControllerOne, login: true),
            const SizedBox(height: 16),
            InkWell(
              child: Text(
                "Esqueceu a senha?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Get.toNamed(Routes.forgotPasswordOne);
              },
            ),
            const SizedBox(height: 30),
            Button(
              formKey: _formKey,
              name: "Login",
              route: Routes.principal,
            ),
          ],
        ),
      ),
    );
  }
}
