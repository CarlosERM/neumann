import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ResearchGroupTile extends StatelessWidget {
  ResearchGroupTile({super.key, required this.title, required this.subtitle});
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      color: const Color.fromRGBO(241, 241, 241, 1.000),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.none,
            color: Color.fromRGBO(122, 122, 122, 1.000),
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
