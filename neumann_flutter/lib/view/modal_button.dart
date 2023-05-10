import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalButton extends StatelessWidget {
  ModalButton({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: Theme.of(context).textButtonTheme.style,
      child: Text(
        name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      onPressed: () {
        if (name == 'Sim') {
          Get.back();
          Get.back();
        } else if (name == 'Não') {
          Get.back();
        }
      },
    );
  }
}
