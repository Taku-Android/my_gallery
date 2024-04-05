import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import 'custom_gallery_button.dart';

class GalleryButtons extends StatelessWidget {
  const GalleryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomGalleryButton(image: AssetsPaths.logout, title: 'log out'),
          CustomGalleryButton(image: AssetsPaths.upload, title: 'upload'),

        ],
      ),
    );
  }
}