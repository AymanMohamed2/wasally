import 'package:flutter/material.dart';

import 'custom_item_home.dart';

class CustomGrideView extends StatelessWidget {
  const CustomGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return const CustomItemHomeView();
          },
        ),
      ),
    );
  }
}
