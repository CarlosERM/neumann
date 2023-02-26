import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/form/login_form.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('assets/icons/neumann_logo_horizontal.jpg'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                LoginForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
