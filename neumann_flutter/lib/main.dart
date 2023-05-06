import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/pages/home.dart';
import './view/forgot_password.dart';
import 'view/principal.dart';
import './view/login.dart';
import './view/register.dart';
import 'util/theme.dart';
import 'util/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'Neumann',
      theme: theme,
      home: const Login(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: [
        GetPage(
          name: Routes.login,
          page: () => const Login(),
        ),
        GetPage(
          name: Routes.forgotPassword,
          page: () => ForgotPassword(),
        ),
        GetPage(
          name: Routes.register,
          page: () => const Register(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
        GetPage(
          name: Routes.principal,
          page: () => Principal(),
        ),
      ],
    );
  }
}
