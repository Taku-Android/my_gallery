import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/core/utils/dialog_helper.dart';
import 'package:my_gallery/presentation/bloc/upload_bloc/upload_cubit.dart';
import 'package:my_gallery/presentation/screens/login.dart';

import '../../../core/utils/assets.dart';
import 'custom_gallery_button.dart';

class GalleryButtons extends StatefulWidget {
  const GalleryButtons({super.key});

  @override
  State<GalleryButtons> createState() => _GalleryButtonsState();
}

class _GalleryButtonsState extends State<GalleryButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Login(),
                  ),
                );
              },
              child: const CustomGalleryButton(
                  image: AssetsPaths.logout, title: 'log out')),
          GestureDetector(
              onTap: () {
                DialogHelper.uploadImageDialog(context,
                    onButton1Pressed: () async {
                  var file = await pickImageFromGallery();
                   uploadImageFile(file!);
                }, onButton2Pressed: () async {
                  var file = await pickImageFromCamera();
                   uploadImageFile(file!);
                });
              },
              child: const CustomGalleryButton(
                  image: AssetsPaths.upload, title: 'upload')),
        ],
      ),
    );
  }

  Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();

    // Pick image from gallery
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // If user cancels or picks no image, return null
    if (pickedFile == null) return null;

    // Return the picked image file
    return File(pickedFile.path);
  }

  Future<File?> pickImageFromCamera() async {
    final picker = ImagePicker();

    // Pick image from gallery
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    // If user cancels or picks no image, return null
    if (pickedFile == null) return null;

    // Return the picked image file
    return File(pickedFile.path);
  }

  uploadImageFile(File file) {
    BlocProvider.of<UploadCubit>(context).upload(file);
  }
}
