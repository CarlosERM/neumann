import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.formKey, required this.name});
  final GlobalKey<FormState> formKey;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      child: Text(name),
    );
  }
}
