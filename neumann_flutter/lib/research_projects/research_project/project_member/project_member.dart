import 'package:flutter/material.dart';

class ProjectMember extends StatelessWidget {
  const ProjectMember({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 2.0,
          child: ListTile(
            onTap: () {},
            leading: const CircleAvatar(),
            title: Text(name, style: Theme.of(context).textTheme.bodySmall),
            trailing: IconButton(
              onPressed: () {
                print("Delete");
              },
              icon: const Icon(
                Icons.delete,
                size: 16.0,
                color: Color.fromRGBO(
                  205,
                  25,
                  30,
                  1.000,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
