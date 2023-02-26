import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/email_input.dart';
import 'package:neumann_flutter/view/components/form/password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailInput(),
          const SizedBox(height: 18),
          PasswordInput(),
          const SizedBox(height: 30),
          const Button(),
        ],
      ),
    );
  }
}
