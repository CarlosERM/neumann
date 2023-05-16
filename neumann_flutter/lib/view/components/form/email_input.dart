import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/email_input_controller.dart';

class EmailInput extends StatelessWidget {
  EmailInput({super.key});
  final EmailInputController ie = Get.put(
    EmailInputController(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: ie.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            hintText: "john.doe@gmail.com",
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
          validator: (email) {
            if (email == null || email.isEmpty || !ie.validateEmail(email)) {
              return 'O email é inválido.';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
