import 'package:flutter/material.dart';
import '../components/form/registration_form.dart';
import '../components/modal/modal.dart';

class Register extends StatelessWidget {
  const Register({super.key});
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                elevation: 0.0,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: RegistrationForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
