import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/controller/my_navigation_bar_controller.dart';
import 'package:neumann_flutter/view/components/my_app_bar.dart';
import 'package:neumann_flutter/view/pages/home.dart';
import 'package:neumann_flutter/view/pages/research_projects.dart';
import 'package:neumann_flutter/view/pages/profile.dart';
import '../controller/image_controller.dart';
import 'components/form/message_input.dart';
import 'components/publications.dart';
import 'components/research_group_tile.dart';

class Principal extends StatelessWidget {
  Principal({super.key});
  final ImageController ic = Get.put(
    ImageController(),
  );
  final MyNavigationBarController nb = Get.put(
    MyNavigationBarController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: nb.selectedIndex.value,
          children: [
            Home(),
            ResearchProjects(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 1,
          currentIndex: nb.selectedIndex.value,
          onTap: nb.selectIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Projetos de Pesquisa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}
