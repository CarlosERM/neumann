import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/util/routes.dart';

import '../../participante_model.dart';
import 'my_card_controller.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.members,
  });
  final String id;
  final String title;
  final String description;
  final List<Participante> members;

  final MyCardController mcc = Get.put(MyCardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: Color.fromRGBO(0, 0, 0, 1),
            blurRadius: 5.0,
            spreadRadius: -9.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          mcc.members = members;
          Get.toNamed(
            Routes.researchProject,
            arguments: [
              {"id": id},
              {"title": title},
              {"description": description},
              {"members": members},
            ],
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ObxValue(
                            (data) => TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: mcc.canEnter.value
                                    ? const Color.fromRGBO(
                                        122,
                                        122,
                                        122,
                                        1,
                                      )
                                    : const Color.fromRGBO(
                                        0,
                                        0,
                                        0,
                                        1.000,
                                      ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                minimumSize: const Size(100, 30),
                              ),
                              onPressed: () {
                                mcc.members = members;
                                mcc.toggleProject(
                                    id, title, description, members);
                              },
                              child: Text(
                                data.value ? "Participando" : "Participar",
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(255, 255, 255, 1.000),
                                ),
                                softWrap: false,
                              ),
                            ),
                            false.obs,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
