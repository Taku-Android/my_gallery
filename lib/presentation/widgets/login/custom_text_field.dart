import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.hintText,
        required this.controller,
        required this.validator});

  final String hintText;

  final TextEditingController controller;

  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            contentPadding:  EdgeInsets.symmetric(horizontal: 14.w , vertical:14.h),
            hintText: hintText,
            hintStyle: Styles.subTitle.copyWith(
              color: Colors.grey
            )
        ));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: BorderSide.none,
    );
  }
}