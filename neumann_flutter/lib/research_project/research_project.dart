import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/util/routes.dart';
import '../components/modal/modal.dart';
import 'project_member/project_member.dart';

class ResearchProject extends StatelessWidget {
  const ResearchProject({super.key});
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Modal(
                              title: "Sair",
                              content: "Tem certeza que deseja sair?",
                            );
                          },
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Modal(
                                title: "Editar",
                                content: "Tem certeza que deseja editar?",
                              );
                            },
                          );
                          Get.toNamed(Routes.registrationResearchProject);
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
                        "Iniciação Científica",
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 30.0),
                      ProjectMember(name: "Carlos Eduardo Rocha Miranda"),
                      ProjectMember(name: "Carlos Eduardo Rocha Miranda"),
                      ProjectMember(name: "Carlos Eduardo Rocha Miranda"),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
