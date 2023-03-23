import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: SizeConfig.defaultSize! * 20,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        'assets/images/slider1.jpg',
        'assets/images/slider2.jpg',
        'assets/images/slider3.jpg'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(i),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
