import 'package:flutter/material.dart';

import 'page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, @required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          title: 'Shopping',
          subTitle: 'Explore top organic Fruits & grab them',
          image: 'assets/images/onboarding1.png',
        ),
        PageViewItem(
          title: 'Delivery on the way',
          subTitle: 'Get your order by speed delivery',
          image: 'assets/images/onboarding2.png',
        ),
        PageViewItem(
          title: 'Delivery Arrived',
          subTitle: 'Order is arrived at your Place',
          image: 'assets/images/onboarding3.png',
        ),
      ],
    );
  }
}
