import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumann_flutter/components/form/dropdown_menu/my_dropdown_menu_controller.dart';

class MyDropdownMenu extends StatelessWidget {
  MyDropdownMenu({super.key});
  final MyDropdownMenuController dmc = Get.put(MyDropdownMenuController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Obx(
          () => DropdownButton(
            hint: const Text(
              'Estudante',
            ),
            onChanged: (newValue) {
              dmc.setSelected(newValue!);
            },
            value: dmc.selected.value,
            items: dmc.list.map(
              (selectedType) {
                return DropdownMenuItem(
                  value: selectedType,
                  child: Text(
                    selectedType,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
