import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/screens/login.dart';

import '../../../core/utils/assets.dart';
import 'custom_gallery_button.dart';

class GalleryButtons extends StatelessWidget {
  const GalleryButtons({super.key});

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
                    builder: (BuildContext context) =>
                        const Login(),
                  ),
                );
              },
              child: const CustomGalleryButton(
                  image: AssetsPaths.logout, title: 'log out')),
          GestureDetector(
              onTap: () {},
              child: const CustomGalleryButton(
                  image: AssetsPaths.upload, title: 'upload')),
        ],
      ),
    );
  }
}
