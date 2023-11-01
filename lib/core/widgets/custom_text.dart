import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color = Colors.black,
      this.fontSize,
      this.textAlign,
      this.textOverflow});
  final String text;
  final FontWeight? fontWeight;
  final Color color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      textAlign: textAlign,
    );
  }
}
