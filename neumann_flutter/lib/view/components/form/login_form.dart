import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/password_input.dart';
import 'email_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
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
            PasswordInput(),
            const SizedBox(height: 16),
            InkWell(
              child: Text(
                "Esqueceu a senha?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                // Get.toNamed("forgot_password");
              },
            ),
            const SizedBox(height: 30),
            Button(formKey: _formKey, name: "Login"),
          ],
        ),
      ),
    );
  }
}
