import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasally/core/constants.dart';

import '../category_details_view.dart';

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
        child: GridTile(
          child: Image.asset(kLogo),
          footer: Container(
            color: Colors.yellow.withOpacity(0.5),
            child: Text(
              'Categories',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        margin: const EdgeInsets.all(15),
      ),
    );
  }
}
