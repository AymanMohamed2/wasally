import 'package:easy_localization/easy_localization.dart';
import 'package:wasally/core/utils/app_strings.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: AppStrings.onBoardingTitle1.tr(),
    image: "assets/images/onboarding1.png",
    desc: AppStrings.onBoardingbody1.tr(),
  ),
  OnboardingContents(
    title: AppStrings.onBoardingTitle2.tr(),
    image: "assets/images/onboarding2.png",
    desc: AppStrings.onBoardingbody2.tr(),
  ),
  OnboardingContents(
    title: AppStrings.onBoardingTitle3.tr(),
    image: "assets/images/onboarding3.png",
    desc: AppStrings.onBoardingbody3.tr(),
  ),
];
