import 'package:flutter/material.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      margin: const EdgeInsets.all(15),
      child: InkWell(
        onTap: onTap,
        child: GridTile(
          footer: Container(
            color: Colors.yellow.withOpacity(0.5),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
