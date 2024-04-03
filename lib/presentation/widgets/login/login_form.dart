import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: Text('LOG IN', style: Styles.titleMedium)),
          const SizedBox(
            height: 34,
          ),
          CustomTextField(
              hintText: 'User Name',
              controller: emailController,
              validator: (value) {
                return '';
              }),
          const SizedBox(
            height: 34,
          ),
          CustomTextField(
              hintText: 'Password',
              controller: passController,
              validator: (value) {
                return '';
              }),
          const SizedBox(
            height: 34,
          ),
          CustomButton(onPressed: () {}),
        ],
      ),
    );
  }
}
