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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomText(
        text: 'Menu',
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.area! * 0.00004,
      ),
    );
  }
}
