import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/core/utils/custom_error_widget.dart';
import 'package:my_gallery/core/utils/custom_loading_widget.dart';
import 'package:my_gallery/presentation/bloc/images_bloc/images_cubit.dart';
import 'package:my_gallery/presentation/bloc/images_bloc/images_state.dart';
import 'gallery_list_item.dart';

class GalleryGridView extends StatelessWidget {
  const GalleryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
        if(state is ImagesFailure){
          return CustomErrorWidget(errMessage: state.errMsg);
        }else if(state is ImagesSuccess){
          var imageList = state.getImagesModel.data!.images;
          return GridView.builder(
            itemCount: imageList!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 items per row
              crossAxisSpacing: 7.0, // adjust as needed
              mainAxisSpacing: 7.0, // adjust as needed
            ),
            itemBuilder: (BuildContext context, int index) {
              // replace this with your actual list item widget
              return  GalleryListItem(image: imageList[index]);
            },
          );
        }else{
          return const CustomLoadingWidget();
        }

      },
    );
  }
}