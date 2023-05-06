import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Publication extends StatelessWidget {
  const Publication({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.black,
      leading: const CircleAvatar(),
      title: const Text.rich(
        TextSpan(
          text: "Jesmmer",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: " coordenador",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(150, 150, 150, 1),
              ),
            ),
            TextSpan(
              text: "\n25/12/2021, 08:37",
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(150, 150, 150, 1),
              ),
            ),
          ],
        ),
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 5),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
            style: TextStyle(
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
                  const SizedBox(
                    width: 14.0,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    onTap: () {
                      print("Edit");
                    },
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
              InkWell(
                  child: const Icon(
                    Icons.delete,
                    size: 16.0,
                    color: Color.fromRGBO(205, 25, 30, 1.000),
                  ),
                  onTap: () {
                    print("Delete");
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
