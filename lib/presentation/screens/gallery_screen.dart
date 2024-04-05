import 'package:flutter/material.dart';
import 'package:my_gallery/data/model/User.dart';
import '../widgets/gallery/gallery_body.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key, required this.user});

  final User user ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: GalleryBody(user: user)),
    );
  }
}
