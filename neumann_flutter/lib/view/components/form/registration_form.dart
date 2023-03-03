import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/input_name/input_name.dart';
import 'package:neumann_flutter/view/components/form/input_password/password_input.dart';
import 'input_email/email_input.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputName(),
          const SizedBox(height: 18),
          EmailInput(),
          const SizedBox(height: 18),
          PasswordInput(),
          const SizedBox(height: 18),
          PasswordInput(),
          const SizedBox(height: 18),
          Button(formKey: _formKey),
        ],
      ),
    );
  }
}
