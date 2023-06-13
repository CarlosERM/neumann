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
              onPressed: () async {
                if (mc.editarPub) {
                  String message = await mc.updatePub();
                  print(message);
                  Get.showSnackbar(
                    GetSnackBar(
                      titleText: Text("Editar",
                          style: Theme.of(context).textTheme.labelLarge),
                      messageText: Text(message,
                          style: Theme.of(context).textTheme.bodySmall),
                      duration: const Duration(seconds: 3),
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      boxShadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      margin: const EdgeInsets.all(12.0),
                    ),
                  );
                } else {
                  String message = await mc.createPub();
                  Get.showSnackbar(
                    GetSnackBar(
                      titleText: Text("Criar",
                          style: Theme.of(context).textTheme.labelLarge),
                      messageText: Text(message,
                          style: Theme.of(context).textTheme.bodySmall),
                      duration: const Duration(seconds: 3),
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      boxShadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      margin: const EdgeInsets.all(12.0),
                    ),
                  );
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
