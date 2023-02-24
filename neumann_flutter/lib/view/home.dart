import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/input.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/icons/neumann_logo_horizontal.jpg'),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Input(labelText: "Email", hintText: "john.doe@gmail.com"),
                  Input(labelText: "Senha", hintText: "Digite sua senha"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
