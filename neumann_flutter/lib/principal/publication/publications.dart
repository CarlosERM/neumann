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
    return FutureBuilder<List<PubResponseModel>?>(
      future: pc.getAllPubs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Column(
            children: [
              SizedBox(height: 32),
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text("Algum erro aconteceu");
        } else {
          if (snapshot.data.length == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Center(
                    child: Text("Não existe nenhuma publicação.",
                        style: Theme.of(context).textTheme.bodyLarge)),
              ],
            );
          }
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Publication(
                  id: snapshot.data[index].id,
                  conteudo: snapshot.data[index].conteudo,
                  autor: snapshot.data[index].autor,
                );
              });
        }
      },
    );
  }
}
