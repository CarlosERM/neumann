import 'package:flutter/material.dart';

class InputMessage extends StatelessWidget {
  const InputMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 3,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          suffix: const InkWell(
            child: Icon(
              Icons.send,
            ),
          ),
          hintText: "Envie uma mensagem",
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
    );
  }
}
