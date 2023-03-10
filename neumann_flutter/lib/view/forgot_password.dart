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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    EmailInput(),
                    const SizedBox(height: 30.0),
                    Button(
                      formKey: _formKey,
                      name: "Enviar",
                      route: Routes.forgotPassword,
                    )
                  ],
                ),
                const Text("Logo"),
              ],
            ),
          ),
        ));
  }
}
