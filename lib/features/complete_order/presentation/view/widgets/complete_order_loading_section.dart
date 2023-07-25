import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class CompleteOrderLoadingSection extends StatelessWidget {
  const CompleteOrderLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomElevatedButton(
      padding: EdgeInsets.symmetric(horizontal: 42),
      child: CustomLoadingIndicator(),
    );
  }
}
