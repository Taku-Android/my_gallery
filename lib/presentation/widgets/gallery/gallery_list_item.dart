import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';

class GalleryListItem extends StatelessWidget {
  const GalleryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset(
      AssetsPaths.pic1,
      width: size.width / 4,
      fit: BoxFit.fill,
    );
  }
}