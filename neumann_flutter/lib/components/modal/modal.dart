import 'package:flutter/material.dart';

import 'modal_button.dart';

class Modal extends StatelessWidget {
  Modal({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsOverflowButtonSpacing: 24.0,
      actions: const [
        ModalButton(name: "Sim"),
        ModalButton(name: "Não"),
      ],
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      content: SizedBox(
        width: 300,
        child: Text(content),
      ),
    );
  }
}
