import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCard extends StatelessWidget {
  MyCard({super.key});

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
          print("Abrir publicação.");
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
                  leading: const CircleAvatar(),
                  title: Text(
                    'Iniciação Científica',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ObxValue(
                            (data) => TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: data.value
                                    ? const Color.fromRGBO(
                                        0,
                                        0,
                                        0,
                                        1.000,
                                      )
                                    : const Color.fromRGBO(
                                        122,
                                        122,
                                        122,
                                        1,
                                      ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                minimumSize: const Size(100, 30),
                              ),
                              onPressed: () {
                                data.value = !data.value;
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
