import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wasally/features/on_boarding/presentation/view/onboarding_view.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    this.isLogin,
  });

  final bool? isLogin;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FlutterSplashScreen.fadeIn(
      duration: const Duration(seconds: 3),
      backgroundColor: const Color(0xffFCFCFF),
      childWidget: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Image.asset("assets/images/new_splash.gif"),
      ),
      defaultNextScreen: isLogin == true
          ? BottomNavigationBarHome()
          : const OnboardingScreen(),
    );
  }
}
