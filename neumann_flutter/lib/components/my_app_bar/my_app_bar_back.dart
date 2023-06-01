import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modal/modal.dart';

class MyAppBarBack extends StatelessWidget with PreferredSizeWidget {
  MyAppBarBack({
    super.key,
    required this.name,
    required this.important,
  });
  final bool important;
  final String name;
  @override
  Size get preferredSize => const Size.fromHeight(76.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        name,
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
          if (important) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Modal(
                  title: "Sair",
                  content: "Tem certeza que deseja sair?",
                );
              },
            );
          } else {
            Get.back();
          }
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}