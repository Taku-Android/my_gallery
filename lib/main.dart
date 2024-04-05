import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'my_gallery.dart';

Future<void> main() async {
  await setupServiceLocator();
  runApp(const MyGallery());
}
