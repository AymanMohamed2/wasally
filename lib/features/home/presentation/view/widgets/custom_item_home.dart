import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

class CustomItemHomeView extends StatelessWidget {
  const CustomItemHomeView({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: GridTile(
          footer: Container(
            color: Colors.yellow.withOpacity(0.5),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.defaultSize! * 1.5),
            ),
          ),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
