import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_app_bar/my_app_bar.dart';
import '../util/routes.dart';
import 'my_card.dart';

class ResearchProjects extends StatelessWidget {
  const ResearchProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.registrationResearchProject);
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              MyAppBar(),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
