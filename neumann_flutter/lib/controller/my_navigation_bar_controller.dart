import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/view/pages/home.dart';
import 'package:neumann_flutter/view/pages/profile.dart';

class MyNavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
    print(selectedIndex);
  }
}
