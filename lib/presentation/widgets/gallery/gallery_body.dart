import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/presentation/bloc/upload_bloc/upload_cubit.dart';
import 'package:my_gallery/presentation/bloc/upload_bloc/upload_state.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/dialog_helper.dart';
import '../../../data/model/User.dart';
import 'gallery_buttons.dart';
import 'gallery_grid_view.dart';
import 'gallery_user_info.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key, required this.user});

  final User user;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is UploadLoading) {
          DialogHelper.showLoadingDialog(context);
        }
        if (state is UploadFailure) {
          Navigator.pop(context);
          DialogHelper.showInfoDialog(context, state.errMsg, onOkPressed: () {
            Navigator.pop(context);
          });
        }
        if (state is UploadSuccess) {
          DialogHelper.hideLoadingDialog();
          DialogHelper.showInfoDialog(context, state.loginResponse.message!, onOkPressed: () {
            Navigator.pop(context);
          });
        }
      },
      child: Stack(
        children: [
          Image.asset(
            AssetsPaths.gallery,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,),
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
      ),
    );
  }
}