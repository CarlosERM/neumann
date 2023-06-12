import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/home/message_controller.dart';

//ignore: must_be_immutable
class MessageInput extends StatelessWidget {
  MessageInput({super.key});
  MessageController mc = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: mc.tec,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
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
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (mc.editarPub) {
                  mc.updatePub();
                } else {
                  mc.createPub();
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 0, 0, 1.000),
                ),
              ),
              child: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
