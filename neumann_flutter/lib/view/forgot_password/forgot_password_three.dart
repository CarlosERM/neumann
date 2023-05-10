import 'package:flutter/material.dart';
import '../../../util/routes.dart';
import '../components/form/button.dart';
import '../components/form/password_input.dart';
import '../components/modal.dart';
import '../components/my_app_bar_password.dart';

class ForgotPasswordThree extends StatelessWidget {
  ForgotPasswordThree({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: MyAppBarPassword(important: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Digite a sua nova senha",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 30),
                  PasswordInput(),
                  const SizedBox(height: 18),
                  PasswordInput(),
                  const SizedBox(height: 30),
                  Button(
                    formKey: _formKey,
                    name: "Trocar a senha",
                    route: Routes.login,
                  ),
                ],
              ),
              const Image(
                width: 256,
                height: 125,
                image: AssetImage('assets/icons/neumann_logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
