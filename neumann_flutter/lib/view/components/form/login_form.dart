import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/email_input.dart';
import 'package:neumann_flutter/view/components/form/password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EmailInput(),
          const SizedBox(height: 18),
          PasswordInput(),
          const SizedBox(height: 16),
          Text(
            "Esqueceu a senha",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          const Button(),
        ],
      ),
    );
  }
}
