import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../form/profile_picture/image_controller.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.username = ''});
  final String username;

  @override
  Size get preferredSize => const Size.fromHeight(76.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 76.0,
      elevation: 0.0,
      backgroundColor: Theme.of(context).colorScheme.background,
      automaticallyImplyLeading: false,
      title: Text.rich(
        username.isNotEmpty
            ? TextSpan(
                text: "Bem vindo",
                style: Theme.of(context).textTheme.headlineSmall,
                children: [
                  TextSpan(
                    text: "\n$username",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              )
            : TextSpan(
                text: "Projetos de Pesquisa",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
      ),
      actions: [
        GetBuilder<ImageController>(
          builder: (_) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: CircleAvatar(
              backgroundImage: _.imageFile != null
                  ? Image.file(
                      File(_.imageFile!.path),
                    ).image
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
