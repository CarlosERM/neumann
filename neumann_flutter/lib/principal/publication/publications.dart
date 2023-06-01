import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/principal/publication/pub_controller.dart';
import 'pub_response_model.dart';
import 'publication.dart';

class Publications extends StatelessWidget {
  Publications({super.key});
  final PubController pc = Get.put(PubController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshPubs,
      key: _refreshIndicatorKey,
      child: FutureBuilder<List<PubResponseModel>?>(
        future: pc.getAllPubs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Publication(
                      conteudo: snapshot.data[index].conteudo,
                      autor: snapshot.data[index].autor);
                });
          } else {
            return Column(
              children: const [
                SizedBox(height: 32),
                // Center(child: CircularProgressIndicator()),
                Publication(
                  conteudo: "Lorem ipsum Lorem Ipsum.",
                  autor: "Carlos Eduardo Rocha Miranda",
                )
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> refreshPubs() async {
    await pc.getAllPubs();
  }
}
