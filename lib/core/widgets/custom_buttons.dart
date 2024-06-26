import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CostumButtonSignUp extends StatelessWidget {
  const CostumButtonSignUp(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.padding})
      : super(key: key);
  final String text;
  final Function() onTap;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: padding),

        backgroundColor: Colors.orange,
        // primary: Colors.orange,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class CustomButtonGetPosition extends StatelessWidget {
  const CustomButtonGetPosition({super.key, this.onTap, required this.child});

  final Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          child: child,
        ),
      ),
    );
  }
}
