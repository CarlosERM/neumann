import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeInput extends StatelessWidget {
  const VerificationCodeInput({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onChanged: (String value) {
          if (id == 1) {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            }
          } else if (id == 4) {
            if (value.isNotEmpty) {
              print("Envia pra api e vê se deu.");
            } else {
              FocusScope.of(context).previousFocus();
            }
          } else {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).previousFocus();
            }
          }
        },
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 48.0,
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
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
