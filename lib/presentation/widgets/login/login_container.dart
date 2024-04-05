import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_form.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.w,
        height: 350.h,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white.withOpacity(.5), // Transparent color
                child: const LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
