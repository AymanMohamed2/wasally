import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
          imageUrl: 'assets/images/onboarding1.png',
          title: 'Shopping',
          subTitle: 'Explore top organic Fruits & grab them'),
      Introduction(
          imageUrl: 'assets/images/onboarding2.png',
          title: 'Delivery on the way',
          subTitle: 'Get your order by speed delivery'),
      Introduction(
          imageUrl: 'assets/images/onboarding3.png',
          title: 'Delivery Arrived',
          subTitle: 'Order is arrived at your Place'),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: IntroScreenOnboarding(
        skipTextStyle: const TextStyle(color: Colors.black),
        introductionList: list,
        backgroudColor: Colors.white,
        onTapSkipButton: () {
          Get.off(
            () => const LoginView(),
          );
        },
      ),
    );
  }
}
