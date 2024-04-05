import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:my_gallery/presentation/bloc/login_bloc/login_state.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/styles.dart';
import '../../screens/gallery_screen.dart';
import 'login_container.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          DialogHelper.showLoadingDialog(context);
        }
        if (state is LoginFailure) {
          Navigator.pop(context);
          DialogHelper.showInfoDialog(context, state.errMsg, onOkPressed: () {
            Navigator.pop(context);
          });
        }
        if (state is LoginSuccess) {
          DialogHelper.hideLoadingDialog();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  GalleryScreen(user: state.loginResponse.user!),
            ),
          );
        }
      },
      child: Stack(
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
      ),
    );
  }
}
