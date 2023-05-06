import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/form/message_input.dart';
import 'package:neumann_flutter/view/components/my_app_bar.dart';
import 'package:neumann_flutter/view/components/my_card.dart';
import 'package:neumann_flutter/view/components/publications.dart';
import 'package:neumann_flutter/view/components/research_group_tile.dart';

class ResearchProjects extends StatelessWidget {
  const ResearchProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            MyAppBar(),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    MyCard(),
                    MyCard(),
                    MyCard(),
                    MyCard(),
                    MyCard(),
                    MyCard(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
