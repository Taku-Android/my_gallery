import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/screens/login.dart';

class MyGallery extends StatelessWidget {
  const MyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}