import 'dart:ui';

import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width / 1.2,
        height: size.height / 2,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            // Adjust the sigma values for the blur intensity
            child: Container(
              color: Colors.white.withOpacity(.5), // Transparent color
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
