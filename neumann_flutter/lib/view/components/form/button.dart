import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.formKey, required this.name, this.route = ""});
  final GlobalKey<FormState> formKey;
  final String name;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () {
        // if (formKey.currentState!.validate()) {
        if (route.isNotEmpty) {
          Get.toNamed(route);
        }
        // }
      },
      child: Text(name),
    );
  }
}
