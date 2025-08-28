import 'dart:io';
import 'package:ecommerce_admin_app_php/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageuploadCamera() async {
  XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  //for image svg
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? [
            "svg",
            "SVG",
          ]
        : [
            "PNG",
            "png",
            "jpg",
            "jpeg",
            "gif",
          ],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottomMenu(imageuploadCamera(), fileUploadGallery) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Choose Picture",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            ListTile(
              onTap: () {
                imageuploadCamera();
              },
              leading: const Icon(Icons.camera, size: 35),
              title: const Text(
                "Choose Image From Camera",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
              },
              leading: const Icon(Icons.image, size: 35),
              title: const Text(
                "Choose Image From Gallery",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: AppColor.backgroundcolor,
  );
}
