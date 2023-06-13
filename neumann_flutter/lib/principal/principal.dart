import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/form/profile_picture/image_controller.dart';
import 'my_navigation_bar_controller.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../research_projects/research_projects.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
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
          elevation: 5,
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
