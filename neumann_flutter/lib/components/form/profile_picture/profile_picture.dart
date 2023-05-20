import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'image_controller.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({super.key, this.type});
  final ImageController ic = Get.put(
    ImageController(),
  );
  final type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetBuilder<ImageController>(
        builder: type == 'project'
            ? (_) => Container(
                  height: 252,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(240, 240, 240, 1),
                  ),
                  child: _.imageFile != null
                      ? Image.file(
                          File(_.imageFile!.path),
                        )
                      : const Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(122, 122, 122, 1),
                          size: 72.0,
                        ),
                )
            : (_) => CircleAvatar(
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
