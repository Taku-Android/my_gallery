import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import 'login_container.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AssetsPaths.login,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'My',
                  style: Styles.title,
                ),
                 Text(
                  'Gallery',
                  style: Styles.title,
                ),
                const SizedBox(
                  height: 40,
                ),
                LoginContainer(size: size),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
