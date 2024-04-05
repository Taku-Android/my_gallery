import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import '../../../data/model/User.dart';

class GalleryUserInfo extends StatelessWidget {
  const GalleryUserInfo({super.key, required this.user});

  final User user ;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Welcome \n${user.name}' , style: Styles.titleMedium.copyWith(
            fontWeight: FontWeight.w600 ,
          fontSize: 24.sp
        ),),
        Image.asset(
          AssetsPaths.user,
          width: 50.w,
          height: 50.h,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
