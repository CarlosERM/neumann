import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/routes.dart';
import '../components/form/button.dart';
import '../components/form/password_input/password_input.dart';
import '../components/form/password_input/password_input_controller.dart';
import '../components/my_app_bar/my_app_bar_back.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final PasswordInputController ip = Get.put(PasswordInputController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: const MyAppBarBack(name: "Senha", important: true),
      body: SingleChildScrollView(
        child: Padding(
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
                    PasswordInput(tec: ip.passwordControllerOne),
                    const SizedBox(height: 18),
                    PasswordInput(tec: ip.passwordControllerSecond),
                    const SizedBox(height: 30),
                    Button(
                      formKey: _formKey,
                      name: "Mudar a senha",
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
      ),
    );
  }
}
