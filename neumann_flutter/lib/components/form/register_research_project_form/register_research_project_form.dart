import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/components/form/button.dart';
import 'package:neumann_flutter/components/form/description_input.dart';
import 'package:neumann_flutter/util/routes.dart';
import '../../form/profile_picture/profile_picture.dart';
import '../name_input/name_input.dart';

class RegistrationResearchProjectForm extends StatelessWidget {
  RegistrationResearchProjectForm({super.key, required this.name});

  final _formKey = GlobalKey<FormState>();
  final String name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          ProfilePicture(type: 'project'),
          const SizedBox(height: 24),
          NameInput(name: 'Nome do Projeto'),
          const SizedBox(height: 16),
          const DescriptionInput(name: 'Descrição'),
          const SizedBox(height: 30),
          Button(formKey: _formKey, name: "Cadastrar", route: Routes.principal)
        ],
      ),
    );
  }
}
