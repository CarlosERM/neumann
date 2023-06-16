import 'package:get/get.dart';

class MyDropdownMenuController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "Estudante".obs;
  final list = ["Estudante", "Professor"];
  void setSelected(String value) {
    selected.value = value;
  }
}
