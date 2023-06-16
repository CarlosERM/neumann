import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neumann_flutter/services/authentication_manager.dart';

import 'publication_controller.dart';

//ignore: must_be_immutable
class Publication extends StatelessWidget {
  Publication(
      {super.key,
      required this.id,
      required this.conteudo,
      required this.autor,
      required this.date});
  final String id;
  final String conteudo;
  final String autor;
  final DateTime date;
  PublicationController pc = Get.put(PublicationController());
  AuthenticationManager am = Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: autor,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  children: const [
                    TextSpan(
                      text: " professor",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(150, 150, 150, 1),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                DateFormat('dd/MM/yyyy, HH:mm').format(date),
                style: const TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
              ),
            ],
          ),
          subtitle: Column(
            children: [
              const SizedBox(height: 5),
              Text(
                textAlign: TextAlign.left,
                conteudo,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ObxValue(
                        (data) => InkWell(
                          child: Icon(
                            Icons.thumb_up,
                            size: 16.0,
                            color: data.value
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromRGBO(122, 122, 122, 1.000),
                          ),
                          onTap: () {
                            data.value = !data.value;
                          },
                        ),
                        false.obs,
                      ),
                      Visibility(
                        visible: am.isProfessor(),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 14.0,
                            ),
                            InkWell(
                              child: const Icon(
                                Icons.edit,
                                size: 16,
                              ),
                              onTap: () {
                                pc.editPub(id, conteudo);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      const Text(
                        "1 likes",
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: am.isProfessor(),
                    child: IconButton(
                      onPressed: () async {
                        String message = await pc.deletePub(id);
                        Get.showSnackbar(
                          GetSnackBar(
                              titleText: Text("Remover",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              messageText: Text(message,
                                  style: Theme.of(context).textTheme.bodySmall),
                              duration: const Duration(seconds: 3),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              boxShadows: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              margin: const EdgeInsets.all(12.0)),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 16.0,
                        color: Color.fromRGBO(205, 25, 30, 1.000),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
