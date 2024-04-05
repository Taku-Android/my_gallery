import 'package:flutter/material.dart';
import 'gallery_list_item.dart';

class GalleryGridView extends StatelessWidget {
  const GalleryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 items per row
        crossAxisSpacing: 4.0, // adjust as needed
        mainAxisSpacing: 4.0, // adjust as needed
      ),
      itemBuilder: (BuildContext context, int index) {
        // replace this with your actual list item widget
        return const GalleryListItem();
      },
    );
  }
}