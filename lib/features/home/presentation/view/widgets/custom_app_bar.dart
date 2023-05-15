import 'package:flutter/material.dart';

import 'package:wasally/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.image,
  });

  final IconData icon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: SizeConfig.screenHeight! * 0.03,
            )),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenWidth! * 0.02,
              right: SizeConfig.screenWidth! * 0.02),
          child: Image.asset(
            image,
            height: SizeConfig.defaultSize! * 5,
          ),
        ),
      ],
    );
  }
}
