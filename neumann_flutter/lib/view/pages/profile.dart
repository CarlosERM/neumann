import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla congue ligula at dictum semper. Maecenas luctus sapien sed blandit tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla facilisi. Morbi et luctus nisi, eu finibus turpis. Pellentesque semper lectus eget lorem fringilla pulvinar. Cras hendrerit lacinia diam ut pharetra. "),
      ),
    );
  }
}
