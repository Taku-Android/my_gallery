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
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
        child:  Text('SUBMIT' , style: Styles.subTitle.copyWith(
          color: Colors.white
        ),),
      ),
    );
  }
}