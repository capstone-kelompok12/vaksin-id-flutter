import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.bgColor,
    this.margin,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: whiteTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}