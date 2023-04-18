import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/category_details_view.dart';

class CustomItemHomeView extends StatelessWidget {
  const CustomItemHomeView({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const CategoryDetailsView(
            title: 'Cock',
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
        margin: const EdgeInsets.all(15),
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
