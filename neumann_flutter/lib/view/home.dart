import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/components/form/login_form.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
              width: 256,
              height: 125,
              image: AssetImage('assets/icons/neumann_logo_horizontal.jpg'),
            ),
            const LoginForm(),
            Column(children: [
              Text("Não possui uma conta?",
                  style: Theme.of(context).textTheme.labelSmall),
              InkWell(
                child: Text(
                  "Cadastre-se",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () {
                  Get.toNamed("register");
                },
              ),
            ])
            // Text.rich(
            //   style: Theme.of(context).textTheme.labelSmall,
            //   textAlign: TextAlign.center,
            //   TextSpan(
            //     text: "Não possui uma conta?",
            //     children: [
            //       InkWell(),
            //       TextSpan(
            //         style: Theme.of(context).textTheme.bodyMedium,
            //         text: "\nCadastre-se",
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
