import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: Styles.subTitle,
        onPrimary: Colors.white,
        backgroundColor: const Color(0xff7BB3FF), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('SUBMIT'),
      ),
    );
  }
}