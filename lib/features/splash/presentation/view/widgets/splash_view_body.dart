import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

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
      defaultNextScreen:
          isLogin == true ? BottomNavigationBarHome() : const OnBoardingView(),
    );
  }
}
