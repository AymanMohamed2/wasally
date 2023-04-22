import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 16)});
  final Widget child;

  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        padding: padding,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
