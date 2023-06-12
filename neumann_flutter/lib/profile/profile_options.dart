import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/authentication_manager.dart';
import '../util/routes.dart';

class ProfileOptions extends StatelessWidget {
  ProfileOptions({super.key, required this.icon, required this.name});
  final Icon icon;
  final String name;
  final AuthenticationManager authManager = AuthenticationManager();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: () {
          if (name == 'Editar Perfil') {
            Get.toNamed(Routes.editProfile);
          } else if (name == 'Logout') {
            authManager.logOut();
          }
        },
        minLeadingWidth: 10,
        leading: icon,
        title: Text(name, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
