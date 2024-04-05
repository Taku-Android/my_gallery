import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import '../../../data/model/User.dart';
import 'gallery_buttons.dart';
import 'gallery_grid_view.dart';
import 'gallery_user_info.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key, required this.user});

  final User user ;


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
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0 , ),
          child: Column(
            children: [
              GalleryUserInfo(user: user),
              const SizedBox(height: 40,),
              const GalleryButtons(),
              const SizedBox(height: 30,),
              const Expanded(child: GalleryGridView()),

            ],
          ),
        ),

      ],
    );
  }
}