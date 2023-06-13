import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_app_bar/my_app_bar.dart';
import '../components/form/profile_picture/image_controller.dart';
import '../principal/publication/pub_controller.dart';
import 'message_input.dart';
import '../principal/publication/publications.dart';
import '../principal/research_group_tile.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final ImageController ic = Get.put(
    ImageController(),
  );

  final HomeController hc = Get.put(
    HomeController(),
  );
  final PubController pc = Get.put(PubController());

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
                  return const CircularProgressIndicator();
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
                  MessageInput(),
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
