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
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: padding),

        backgroundColor: Colors.orange,
        // primary: Colors.orange,
      ),
    );
  }
}

class CustomButtonGetPosition extends StatelessWidget {
  const CustomButtonGetPosition({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: const Card(
          child: ListTile(
            title: Text("Press here to get your Position"),
            leading: Icon(Icons.location_pin),
            iconColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}
