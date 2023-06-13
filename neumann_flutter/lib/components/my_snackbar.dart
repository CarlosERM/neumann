import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBar extends StatelessWidget {
  MySnackBar({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GetSnackBar(
      titleText: Text(title, style: Theme.of(context).textTheme.labelLarge),
      messageText: Text(
        description,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      duration: const Duration(
        seconds: 3,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.background,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
      margin: const EdgeInsets.all(12.0),
    );
  }
}
