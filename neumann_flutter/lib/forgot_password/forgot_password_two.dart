import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/routes.dart';
import '../components/form/button.dart';
import '../components/form/verification_code_input.dart';
import '../components/my_app_bar/my_app_bar_password.dart';

class ForgotPasswordTwo extends StatelessWidget {
  ForgotPasswordTwo({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: MyAppBarPassword(
        important: false,
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
                    "Digite o código",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: const [
                      VerificationCodeInput(id: 1),
                      SizedBox(width: 10.0),
                      VerificationCodeInput(id: 2),
                      SizedBox(width: 10.0),
                      VerificationCodeInput(id: 3),
                      SizedBox(width: 10.0),
                      VerificationCodeInput(id: 4),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Button(
                    formKey: _formKey,
                    name: "Enviar",
                    route: Routes.forgotPasswordThree,
                  )
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
