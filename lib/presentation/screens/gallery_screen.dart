import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/core/service_locator.dart';
import 'package:my_gallery/data/model/User.dart';
import 'package:my_gallery/presentation/bloc/upload_bloc/upload_cubit.dart';
import '../widgets/gallery/gallery_body.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadCubit(getIt()),
      child: Scaffold(
        body: SafeArea(child: GalleryBody(user: user)),
      ),
    );
  }
}
