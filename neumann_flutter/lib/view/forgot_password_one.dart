import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/email_input.dart';
import '../../../util/routes.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
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
            print("Volta pra trás.");
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Digite o seu email",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 16.0),
                  EmailInput(),
                  const SizedBox(height: 30.0),
                  Button(
                    formKey: _formKey,
                    name: "Enviar",
                    route: Routes.forgotPassword,
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
