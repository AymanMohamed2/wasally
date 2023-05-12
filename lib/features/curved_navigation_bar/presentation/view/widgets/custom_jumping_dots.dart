import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

import '../../../../../core/utils/size_config.dart';

class CustomJumpingDots extends StatelessWidget {
  const CustomJumpingDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.005,
      child: JumpingDots(
        innerPadding: 0,
        color: Colors.black,
        radius: 10,
        numberOfDots: 3,
      ),
    );
  }
}
