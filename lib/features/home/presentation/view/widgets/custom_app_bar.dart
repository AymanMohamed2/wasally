import 'package:flutter/material.dart';

import 'package:wasally/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.icon, required this.image, this.title = ''});

  final IconData icon;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.defaultSize! * 2,
              right: SizeConfig.defaultSize! * 2),
          child: Image.asset(
            image,
            height: SizeConfig.defaultSize! * 5,
          ),
        ),
        Text(title),
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
        )
      ],
    );
  }
}
