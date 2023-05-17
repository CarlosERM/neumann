import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/image_controller.dart';
import '../controller/my_navigation_bar_controller.dart';
import 'components/form/message_input.dart';
import 'components/my_app_bar.dart';
import 'components/publications.dart';
import 'components/research_group_tile.dart';
import '../controller//home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final ImageController ic = Get.put(
    ImageController(),
  );
  final MyNavigationBarController nb = Get.put(
    MyNavigationBarController(),
  );
  final HomeController hc = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            FutureBuilder(
              future: hc.getUsername(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MyAppBar(
                    username: snapshot.data!,
                  );
                } else {
                  return MyAppBar(
                    username: "Seita",
                  );
                }
              },
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
                  InputMessage(),
                  Publications(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
