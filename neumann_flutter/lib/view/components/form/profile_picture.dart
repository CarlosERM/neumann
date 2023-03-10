import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/image_controller.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({super.key});
  final ImageController ic = Get.put(
    ImageController(),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetBuilder<ImageController>(
        builder: (_) => CircleAvatar(
          radius: 64,
          backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
          backgroundImage: _.imageFile != null
              ? Image.file(
                  File(_.imageFile!.path),
                ).image
              : null,
          child: _.imageFile != null
              ? null
              : const Icon(
                  Icons.camera_alt,
                  color: Color.fromRGBO(122, 122, 122, 1),
                ),
        ),
      ),
      onTap: () => ic.imagePicker(ImageSource.gallery),
    );
  }
}
