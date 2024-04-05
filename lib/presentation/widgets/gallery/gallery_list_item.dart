import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/custom_loading_widget.dart';

class GalleryListItem extends StatelessWidget {
  const GalleryListItem({super.key, required this.image});

  final String image ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.fill,
        height: size.height / 10,
        width: size.width / 2.5,
        errorWidget: (context, value, _) => Image.asset(AssetsPaths.error),
        placeholder: (context, value) => const CustomLoadingWidget(),
      ),
    );
  }
}