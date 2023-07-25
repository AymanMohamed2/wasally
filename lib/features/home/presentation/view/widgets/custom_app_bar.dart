import 'package:flutter/material.dart';

import 'package:wasally/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.image,
    required this.logo,
  });

  final String image;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            logo,
            height: SizeConfig.defaultSize! * 5,
          ),
          // Image.asset(
          //   image,
          //   height: SizeConfig.defaultSize! * 7,
          // ),
        ],
      ),
    );
  }
}
