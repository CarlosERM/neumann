import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/name_input_controller.dart';

class NameInput extends StatelessWidget {
  NameInput({super.key});

  final NameInputController nic = Get.put(
    NameInputController(),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nome completo",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: nic.nameController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            hintText: "John Doe",
            hintStyle: Theme.of(context).textTheme.bodySmall,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(176, 176, 176, 1.000),
                width: 1.0,
              ),
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
          validator: (name) {
            // if (name == null || name.isEmpty || !nic.validateName(name)) {
            //   return 'O nome é inválido.';
            // } else {
            //   return null;
            // }
          },
        ),
      ],
    );
  }
}
