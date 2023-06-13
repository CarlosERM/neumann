import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/util/routes.dart';
import '../../components/modal/modal.dart';
import 'project_member/project_member.dart';
import 'research_project_controller.dart';

class ResearchProject extends StatelessWidget {
  ResearchProject({super.key});
  ResearchProjectController rpc = Get.put(ResearchProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leading: InkWell(
                      onTap: () {
                        Get.dialog(
                          const Modal(
                            title: "Sair",
                            content: "Tem certeza que deseja sair?",
                          ),
                        );
                      },
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    elevation: 0.0,
                    actions: <Widget>[
                      IconButton(
                        onPressed: () {
                          // Get.dialog(
                          //   const Modal(
                          //     title: "Editar",
                          //     content: "Tem certeza que deseja editar?",
                          //   ),
                          // );
                          rpc.sendDataToEdit();
                          Get.toNamed(Routes.editResearchProject);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30.0),
                      Text(
                        rpc.title,
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        rpc.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 30.0),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: rpc.members.length,
                        itemBuilder: (context, index) {
                          final member = rpc.members[index];
                          return ProjectMember(name: member.participante);
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
