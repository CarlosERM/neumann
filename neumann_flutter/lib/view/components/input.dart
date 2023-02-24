import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Input extends StatefulWidget {
  const Input({super.key, required this.labelText, required this.hintText});
  final String labelText;
  final String hintText;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final teste = true.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 5.0),
        TextField(
          cursorColor: Theme.of(context).colorScheme.secondary,
          obscureText: widget.labelText == "Senha" ? true : false,
          decoration: InputDecoration(
            // suffixIcon: widget.labelText == "Senha"
            //     ? const IconButton(teste ? Icons.visibility : Icons.visibility_off, onPressed: () => ,)
            //     : null,
            hintText: widget.hintText,
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
          ),
        ),
      ],
    );
  }
}
