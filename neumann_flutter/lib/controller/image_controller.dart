import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;

  Future<void> imagePicker(
    ImageSource source, {
    BuildContext? context,
    bool isMultiImage = false,
    double? maxWidth,
    double? maxHeight,
    int? quality,
  }) async {
    XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: quality,
    );
    if (pickedFile != null) {
      imageFile = pickedFile;
    } else {
      print("No image selected");
    }
    update();
  }
}
