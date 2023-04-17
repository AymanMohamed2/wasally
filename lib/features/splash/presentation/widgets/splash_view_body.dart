// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wasally/core/utils/size_config.dart';
// import 'package:wasally/features/on_boarding/presentation/view/on_boarding_view.dart';

// class SplashViewBody extends StatefulWidget {
//   const SplashViewBody({super.key});

//   @override
//   State<SplashViewBody> createState() => _SplashViewBodyState();
// }

// class _SplashViewBodyState extends State<SplashViewBody>
//     with SingleTickerProviderStateMixin {
//   AnimationController? animationController;
//   Animation? fadingAnimation;

//   @override
//   void initState() {
//     super.initState();
//     initAnimation();

//     goToNextView();
//   }

//   @override
//   void dispose() {
//     animationController?.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Image.asset(
//           'assets/images/splash.png',
//           height: MediaQuery.of(context).size.height * 0.3,
//         ),
//         AnimatedBuilder(
//           animation: fadingAnimation!,
//           builder: (context, _) => Opacity(
//             opacity: fadingAnimation?.value,
//             child: const Text(
//               'Wasally - وصل لي',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: 'Gulzar',
//                   fontSize: 45,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   void goToNextView() {
//     Future.delayed(const Duration(seconds: 3), () {
//       Get.to(() => const OnBoardingView(), transition: Transition.fade);
//     });
//   }

//   void initAnimation() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     fadingAnimation =
//         Tween<double>(begin: .2, end: 1).animate(animationController!);

//     animationController?.repeat(reverse: true);
//   }
// }
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wasally/features/on_boarding/presentation/view/on_boarding_view.dart';

import '../../../../core/utils/size_config.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset("assets/images/splash.png"),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      defaultNextScreen: const OnBoardingView(),
    );
    ;
  }
}
