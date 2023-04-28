import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color = Colors.black,
      this.fontSize = 22,
      this.textAlign});
  final String text;
  final FontWeight? fontWeight;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      textAlign: textAlign,
    );
  }
}
