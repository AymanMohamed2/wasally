import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            height: SizeConfig.defaultSize! * 5,
          ),
          Icon(
            icon,
            size: SizeConfig.screenHeight! * 0.03,
          ),
        ],
      ),
    );
  }
}
