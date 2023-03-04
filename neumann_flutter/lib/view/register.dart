import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/form/registration_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              AppBar(
                leading: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.primary,
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
