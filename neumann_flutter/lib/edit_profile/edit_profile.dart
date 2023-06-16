import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/components/form/button.dart';
import 'package:neumann_flutter/components/form/email_input/email_input.dart';

import '../components/form/name_input/name_input.dart';
import '../components/my_app_bar/my_app_bar_back.dart';
import '../util/routes.dart';
import './edit_profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final EditProfileController nic = Get.put(
    EditProfileController(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => nic.getUsernameEmail());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBack(important: true, name: "Editar"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32.0),
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 100,
                    ),
                    Positioned(
                        bottom: 0,
                        right: -20,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(9.0),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 44,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Column(
                    children: [
                      NameInput(
                        name: "Nome completo",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      EmailInput(),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        formKey: _formKey,
                        name: "Salvar",
                        route: 'iii',
                      ),
                      const SizedBox(height: 16),
                      Button(
                        formKey: _formKey,
                        name: "Trocar senha",
                        route: Routes.forgotPassword,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
