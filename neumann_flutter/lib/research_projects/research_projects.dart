import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_app_bar/my_app_bar.dart';
import '../services/authentication_manager.dart';
import '../util/routes.dart';
import 'my_card/my_card.dart';
import 'research_projects_controller.dart';

class ResearchProjects extends StatelessWidget {
  ResearchProjects({super.key});
  final ResearchProjectsController rpc = Get.put(ResearchProjectsController());
  final AuthenticationManager am = Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Visibility(
        visible: am.isProfessor(),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.registrationResearchProject);
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              MyAppBar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rpc.projects.length,
                    itemBuilder: (BuildContext context, int index) {
                      var project = rpc.projects[index];
                      return MyCard(
                        id: project.id,
                        title: project.nome,
                        description: project.descricao,
                        members: project.participantes,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




//  FutureBuilder<List<GetResearchProjectsResponse>>(
//                   future: rpc.getAllResearchProjects(),
//                   builder: (BuildContext context, AsyncSnapshot snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Column(
//                         children: [
//                           SizedBox(height: 32),
//                           Center(child: CircularProgressIndicator()),
//                         ],
//                       );
//                     } else if (snapshot.hasError) {
//                       return const Text("Algum erro aconteceu");
//                     } else {
//                       if (snapshot.data.length == 0) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             const SizedBox(height: 32),
//                             Center(
//                               child: Text(
//                                 "Não existe nenhum projeto de pesquisa.",
//                                 style: Theme.of(context).textTheme.bodyLarge,
//                               ),
//                             ),
//                           ],
//                         );
//                       }
//                       return ListView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return MyCard(
//                             id: snapshot.data[index].id,
//                             title: snapshot.data[index].nome,
//                             description: snapshot.data[index].descricao,
//                             members: snapshot.data[index].participantes,
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),