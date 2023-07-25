import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';

class CustomTextMenu extends StatelessWidget {
  const CustomTextMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: const CustomText(
        text: 'Menu',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
