import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/principal/publication/pub_controller.dart';
import 'pub_response_model.dart';
import 'publication.dart';

class Publications extends StatelessWidget {
  Publications({super.key});
  final PubController pc = Get.put(PubController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: pc.publications.length,
        itemBuilder: (BuildContext context, int index) {
          var publication = pc.publications[index];
          return Publication(
            id: publication.id,
            conteudo: publication.conteudo,
            autor: publication.autor,
          );
        },
      ),
    );
  }
}
