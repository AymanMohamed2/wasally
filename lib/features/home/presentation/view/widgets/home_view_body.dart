import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/widgets/space_widget.dart';

import 'custom_app_bar.dart';
import 'custom_carousel.dart';
import 'custom_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(
            icon: Icons.notifications,
            image: kLogo,
          ),
          VirticalSpace(3),
          CustomCarousel(),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar'),
            ),
          ),
          CustomGrideView(),
        ],
      ),
    );
  }
}
