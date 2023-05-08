import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class VerifyLoadingSection extends StatelessWidget {
  const VerifyLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.3,
            vertical: SizeConfig.screenWidth! * 0.04),
        child: const Center(
          child: CustomLoadingIndicator(),
        ));
  }
}
