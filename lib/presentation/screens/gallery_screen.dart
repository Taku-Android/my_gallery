import 'package:flutter/material.dart';
import '../widgets/gallery/gallery_body.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: GalleryBody()),
    );
  }
}
