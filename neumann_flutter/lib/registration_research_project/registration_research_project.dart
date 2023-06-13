import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/research_projects/register_research_project_form/research_project_form.dart';
import '../components/modal/modal.dart';

class RegistrationResearchProject extends StatelessWidget {
  const RegistrationResearchProject({super.key, required this.name});
  final String name;

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
              AppBar(
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                elevation: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: ResearchProjectForm(name: name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
