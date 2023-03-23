import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasally/core/constants.dart';

import '../view/category_details_view.dart';

class CustomItemHomeView extends StatelessWidget {
  const CustomItemHomeView({
    Key? key,
  }) : super(key: key);

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
            child: const Text(
              'Categories',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: Image.asset(kLogo),
        ),
      ),
    );
  }
}
