import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/controller/pub_controller.dart';
import '../../model/pub_response_model.dart';
import 'publication.dart';

class Publications extends StatelessWidget {
  Publications({super.key});
  final PubController pc = Get.put(PubController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PubResponseModel>?>(
      future: pc.getAllPubs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Publication(
                    titulo: snapshot.data[index].titulo,
                    conteudo: snapshot.data[index].conteudo,
                    autor: snapshot.data[index].autor);
              });
        } else {
          return Column(
            children: const [
              SizedBox(height: 32),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
      },
    );
  }
}
