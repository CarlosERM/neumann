import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/controller/my_navigation_bar_controller.dart';
import 'package:neumann_flutter/view/pages/home.dart';
import 'package:neumann_flutter/view/pages/research_projects.dart';
import 'package:neumann_flutter/view/pages/profile.dart';
import '../controller/image_controller.dart';

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
            const ResearchProjects(),
            const Profile(),
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