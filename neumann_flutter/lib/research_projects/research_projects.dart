import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_app_bar/my_app_bar.dart';
import '../util/routes.dart';
import 'get_research_projects_response.dart';
import 'my_card.dart';
import 'research_projects_controller.dart';

class ResearchProjects extends StatelessWidget {
  ResearchProjects({super.key});
  final ResearchProjectsController rpc = Get.put(ResearchProjectsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.registrationResearchProject);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              const MyAppBar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<List<GetResearchProjectsResponse>>(
                  future: rpc.getAllResearchProjects(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Column(
                        children: [
                          SizedBox(height: 32),
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Text("Algum erro aconteceu");
                    } else {
                      if (snapshot.data.length == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 32),
                            Center(
                              child: Text(
                                "Não existe nenhum projeto de pesquisa.",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        );
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MyCard(
                            id: snapshot.data[index].id,
                            title: snapshot.data[index].nome,
                            description: snapshot.data[index].descricao,
                            members: snapshot.data[index].participantes,
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
