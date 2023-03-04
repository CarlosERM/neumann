import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/components/form/button.dart';
import 'package:neumann_flutter/view/components/form/input_name.dart';
import 'package:neumann_flutter/view/components/form/password_input.dart';
import 'package:neumann_flutter/view/components/form/profile_picture.dart';
import '../../../controller/image_controller.dart';
import '../../../controller/password_input_controller.dart';
import 'email_input.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final PasswordInputController ip1 =
      Get.put(PasswordInputController(), tag: "password_input_controller_1");
  final PasswordInputController ip2 =
      Get.put(PasswordInputController(), tag: "password_input_controller_2");
  final TextEditingController tec1 = TextEditingController();
  final TextEditingController tec2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Crie sua conta",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text.rich(
            TextSpan(
              text: "Já possui uma conta?",
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: " Login",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          ProfilePicture(),
          const SizedBox(height: 40),
          InputName(),
          const SizedBox(height: 16),
          EmailInput(),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Senha",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 5.0),
              Obx(
                () => TextFormField(
                  controller: tec1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  obscureText: ip1.estado.value,
                  decoration: InputDecoration(
                    suffixIconColor: const Color.fromRGBO(176, 176, 176, 1.000),
                    suffixIcon: InkWell(
                      splashColor: Theme.of(context).colorScheme.secondary,
                      child: (ip1.estado.value
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            )),
                      onTap: () => ip1.estado.toggle(),
                    ),
                    hintText: "Digite a sua senha",
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(176, 176, 176, 1.000),
                          width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(217, 217, 217, 1.000),
                        width: 0.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 0.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (password) {
                    if (password == null ||
                        password.isEmpty ||
                        !ip1.validatePassword(password)) {
                      return 'A senha é inválida.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Senha",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 5.0),
              Obx(
                () => TextFormField(
                  controller: tec2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  obscureText: ip2.estado.value,
                  decoration: InputDecoration(
                    suffixIconColor: const Color.fromRGBO(176, 176, 176, 1.000),
                    suffixIcon: InkWell(
                      splashColor: Theme.of(context).colorScheme.secondary,
                      child: (ip2.estado.value
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            )),
                      onTap: () => ip2.estado.toggle(),
                    ),
                    hintText: "Digite a sua senha",
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(176, 176, 176, 1.000),
                          width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(217, 217, 217, 1.000),
                        width: 0.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 0.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (password) {
                    if (password == null ||
                        password.isEmpty ||
                        !ip2.validatePassword(password)) {
                      return 'A senha é inválida.';
                    } else if (tec1.text != tec2.text) {
                      return "A senha é diferente";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Button(formKey: _formKey, name: "Registrar"),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
