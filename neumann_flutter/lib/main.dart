import 'package:flutter/material.dart';
import '/view/home.dart';
import 'util/theme.dart';
// import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersive,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumann',
      theme: theme,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
