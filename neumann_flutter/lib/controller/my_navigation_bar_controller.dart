import 'package:get/get.dart';

class MyNavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
    print(selectedIndex);
  }
}
