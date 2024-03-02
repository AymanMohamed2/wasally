import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';

import 'custom_on_boarding.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
          imageUrl: 'assets/images/onboarding1.png',
          titleTextStyle: TextStyle(fontSize: 30.sp),
          subTitleTextStyle: TextStyle(fontSize: 20.sp),
          title: AppStrings.onBoardingTitle1.tr(),
          subTitle: AppStrings.onBoardingbody1.tr()),
      Introduction(
          imageUrl: 'assets/images/onboarding2.png',
          titleTextStyle: TextStyle(fontSize: 25.sp),
          subTitleTextStyle: TextStyle(fontSize: 20.sp),
          title: AppStrings.onBoardingTitle2.tr(),
          subTitle: AppStrings.onBoardingbody2.tr()),
      Introduction(
          imageUrl: 'assets/images/onboarding3.png',
          titleTextStyle: TextStyle(fontSize: 25.sp),
          subTitleTextStyle: TextStyle(fontSize: 20.sp),
          title: AppStrings.onBoardingTitle3.tr(),
          subTitle: AppStrings.onBoardingbody3.tr()),
    ];
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: CustomOnBoarding(
          text: AppStrings.onBoardingSkip.tr(),
          skipTextStyle: const TextStyle(color: Colors.black),
          introductionList: list,
          backgroudColor: Colors.white,
          onTapSkipButton: () {
            Get.off(
              () => const LoginView(),
            );
          },
        ),
      ),
    );
  }
}
