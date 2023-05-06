import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/components/publication.dart';

class Publications extends StatelessWidget {
  const Publications({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: const <Widget>[
        Publication(),
        SizedBox(height: 16.0),
        Publication(),
        SizedBox(height: 16.0),
        Publication(),
        SizedBox(height: 16.0),
        Publication(),
        SizedBox(height: 16.0),
        Publication(),
        SizedBox(height: 16.0),
        Publication(),
        SizedBox(height: 16.0),
      ],
    );
  }
}
