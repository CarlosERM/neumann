import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/authentication_manager.dart';
import 'profile_options.dart';
import 'profile_controller.dart';

//ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  ProfileController pc = Get.put(ProfileController());
  final AuthenticationManager am = Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: pc.getUsername(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                } else {
                  return Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                }
              },
            ),
            Text(
              am.isProfessor() ? "professor" : "estudante",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ProfileOptions(
                      icon: const Icon(Icons.border_color),
                      name: "Editar Perfil",
                    ),
                    ProfileOptions(
                      icon: const Icon(Icons.auto_stories),
                      name: "Política de Privacidade",
                    ),
                    ProfileOptions(
                        icon: const Icon(Icons.description),
                        name: "Termos de Serviço"),
                    ProfileOptions(
                        icon: const Icon(Icons.logout), name: "Logout"),
                  ],
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
