import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/styles.dart';
import '../../../data/model/login_data.dart';
import '../../bloc/login_bloc/login_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Center(child: Text('LOG IN', style: Styles.titleMedium)),
             SizedBox(
              height: 34.h,
            ),
            CustomTextField(
                hintText: 'User Name',
                controller: emailController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'please enter email';
                  }
                  if (text.length < 3) {
                    return 'Name at least 3 character ';
                  }
                  return null;
                }),
             SizedBox(
              height: 34.h,
            ),
            CustomTextField(
                hintText: 'Password',
                controller: passController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'please enter password';
                  }
                  if (text.length < 6) {
                    return 'password at least 6 character ';
                  }
                  return null;
                }),
             SizedBox(
              height: 16.h,
            ),
            CustomButton(onPressed: () {
            login();
            }),
          ],
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    LoginData loginData = LoginData(email: emailController.text, password: passController.text);
    BlocProvider.of<LoginCubit>(context).login(loginData);
  }
}
