import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/routes.dart';
import '../components/form/button.dart';
import '../components/form/password_input.dart';

class ForgotPasswordThree extends StatelessWidget {
  ForgotPasswordThree({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Senha",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        toolbarHeight: 76.0,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
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
