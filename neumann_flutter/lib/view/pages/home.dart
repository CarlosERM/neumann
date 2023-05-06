import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/controller/my_navigation_bar_controller.dart';
import 'package:neumann_flutter/view/components/my_app_bar.dart';

import '../../controller/image_controller.dart';
import '../components/form/message_input.dart';
import '../components/publications.dart';
import '../components/research_group_tile.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final ImageController ic = Get.put(
    ImageController(),
  );
  final MyNavigationBarController nb = Get.put(
    MyNavigationBarController(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            MyAppBar(
              username: "Jesmmer",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ResearchGroupTile(
                    title: "GEDAIA",
                    subtitle:
                        "Grupo de Excelência em Dados, Automação e Inteligência Artificial.",
                  ),
                  const SizedBox(height: 30),
                  const InputMessage(),
                  const Publications(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
