import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class CustomGalleryButton extends StatelessWidget {
  const CustomGalleryButton({super.key, required this.image, required this.title});

  final String image ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(width: 8,),
          Text(title , style: Styles.subTitle.copyWith(
              color: Colors.black ,
              fontWeight: FontWeight.w400
          ),),
        ],
      ),
    );
  }
}