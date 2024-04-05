import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import 'gallery_buttons.dart';
import 'gallery_grid_view.dart';
import 'gallery_user_info.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AssetsPaths.gallery,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0 , ),
          child: Column(
            children: [
              GalleryUserInfo(),
              SizedBox(height: 40,),
              GalleryButtons(),
              SizedBox(height: 30,),
              Expanded(child: GalleryGridView()),

            ],
          ),
        ),

      ],
    );
  }
}