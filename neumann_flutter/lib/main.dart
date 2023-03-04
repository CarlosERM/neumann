import 'package:flutter/material.dart';
import 'package:neumann_flutter/view/forgot_password.dart';
import '/view/home.dart';
import '/view/register.dart';
import 'util/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

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
      home: const Home(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
        GetPage(
          name: '/forgot_password',
          page: () => const ForgotPassword(),
        ),
        GetPage(
          name: '/register',
          page: () => const Register(),
          transition: Transition.downToUp,
          transitionDuration: Duration(
            milliseconds: 400,
          ),
        ),
      ],
    );
  }
}
