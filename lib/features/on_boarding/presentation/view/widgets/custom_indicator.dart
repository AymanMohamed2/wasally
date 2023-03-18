import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/size_config.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, @required this.dotIndex});
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: SizeConfig.defaultSize! * 18,
      child: DotsIndicator(
        decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8)),
        ),
        dotsCount: 3,
        position: dotIndex!,
      ),
    );
  }
}
