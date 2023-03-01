import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      child: const Text("Login"),
    );
  }
}
