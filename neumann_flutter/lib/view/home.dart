import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/icons/neumann_logo_horizontal.jpg'),
          ),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
