import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_password_controller.dart';

class PasswordInput extends StatelessWidget {
  PasswordInput({super.key});

  final InputPasswordController ip = InputPasswordController();

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
        Obx(
          () => TextFormField(
            cursorColor: Theme.of(context).colorScheme.primary,
            obscureText: ip.estado.value,
            decoration: InputDecoration(
              suffixIconColor: const Color.fromRGBO(176, 176, 176, 1.000),
              suffixIcon: InkWell(
                child: (ip.estado.value
                    ? const Icon(
                        Icons.visibility_off,
                      )
                    : const Icon(
                        Icons.visibility,
                      )),
                onTap: () => ip.estado.toggle(),
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
            validator: (senha) {
              if (senha == null ||
                  senha.isEmpty ||
                  !ip.validatePassword(senha)) {
                return 'A senha é inválida.';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
