import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "Eu sou um homem panamericano.",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          "Eu sou um homem panamericano.",
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    ));
  }
}
