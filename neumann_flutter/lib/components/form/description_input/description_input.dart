import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'description_input_controller.dart';

class DescriptionInput extends StatelessWidget {
  DescriptionInput({super.key, required this.name});
  final String name;

  DescriptionInputController dic = Get.put(DescriptionInputController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: dic.descriptionController,
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: 5,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            hintText: "Ex: Bolsa de estudos de R\$ 400,00",
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
        ),
      ],
    );
  }
}
