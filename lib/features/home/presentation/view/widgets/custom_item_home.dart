import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';

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
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GridTile(
          footer: Container(
            color: kPrimaryColor.withOpacity(0.7),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
