import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalButton extends StatelessWidget {
  const ModalButton({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: name == "Sim"
          ? TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(199, 199, 199, 1.000),
              fixedSize: const Size(43, 40),
            )
          : Theme.of(context).textButtonTheme.style,
      child: Text(
        name,
        style: TextStyle(
          color: name == "Sim"
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
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
