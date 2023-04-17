// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wasally/core/utils/size_config.dart';
// import 'package:wasally/features/auth/presentation/view/login_view.dart';
// import '../../../../core/widgets/custom_buttons.dart';
// import 'custom_indicator.dart';
// import 'custom_page_view.dart';

// class OnBoardingViewBody extends StatefulWidget {
//   const OnBoardingViewBody({super.key});

//   @override
//   State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
// }

// class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
//   PageController? pageController;
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(
//       initialPage: 0,
//     )..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomPageView(
//           pageController: pageController,
//         ),
//         CustomIndicator(
//           dotIndex: pageController!.hasClients ? pageController?.page : 0,
//         ),
//         Visibility(
//           visible: pageController!.hasClients
//               ? (pageController?.page == 2 ? false : true)
//               : true,
//           child: Positioned(
//             top: SizeConfig.defaultSize! * 10,
//             right: 32,
//             child: GestureDetector(
//               onTap: () {
//                 pageController?.nextPage(
//                     duration: const Duration(milliseconds: 600),
//                     curve: Curves.easeIn);
//               },
//               child: const Text(
//                 'Skip',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xff898989),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: SizeConfig.defaultSize! * 10,
//           left: SizeConfig.defaultSize! * 10,
//           bottom: SizeConfig.defaultSize! * 8,
//           child: CustomGeneralButton(
//             onTap: () {
//               if (pageController!.page! < 2) {
//                 pageController?.nextPage(
//                     duration: const Duration(milliseconds: 500),
//                     curve: Curves.easeIn);
//               } else {
//                 Get.to(
//                   () => const LoginView(),
//                   transition: Transition.rightToLeft,
//                   // duration: const Duration(microseconds: 500),
//                 );
//               }
//             },
//             text: pageController!.hasClients
//                 ? (pageController?.page == 2 ? 'Get Started' : 'Next')
//                 : 'Next',
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';

class OnBoardingViewBody extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: IntroScreenOnboarding(
        skipTextStyle: const TextStyle(color: Colors.black),
        introductionList: list,
        backgroudColor: Colors.white,
        onTapSkipButton: () {
          Get.to(() => const LoginView());
        },
      ),
    );
  }
}
