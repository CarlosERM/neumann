import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'password_input_controller.dart';

//ignore: must_be_immutable
class PasswordInput extends StatelessWidget {
  PasswordInput({super.key, required this.tec, this.login = false});
  bool login;
  final TextEditingController tec;
  final PasswordInputController ip = Get.put(PasswordInputController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Senha",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 5.0),
        ObxValue(
          (data) => TextFormField(
            controller: tec,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Theme.of(context).colorScheme.primary,
            obscureText: data.value,
            decoration: InputDecoration(
              suffixIconColor: const Color.fromRGBO(176, 176, 176, 1.000),
              suffixIcon: InkWell(
                customBorder: const CircleBorder(),
                child: (data.value
                    ? const Icon(
                        Icons.visibility_off,
                      )
                    : const Icon(
                        Icons.visibility,
                      )),
                onTap: () => data.value = data.value = !data.value,
              ),
              hintText: "Digite a sua senha",
              hintStyle: Theme.of(context).textTheme.bodySmall,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(176, 176, 176, 1.000), width: 1.0),
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
                  !ip.validatePassword(password)) {
                return 'A senha é inválida.';
              } else {
                if (!login) {
                  if (!ip.passwordIsEqual()) {
                    return "As senhas não são iguais.";
                  } else {
                    return null;
                  }
                }
                return null;
              }
            },
          ),
          true.obs,
        ),
      ],
    );
  }
}
