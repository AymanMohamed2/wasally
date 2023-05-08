import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class LoginLoadingSection extends StatelessWidget {
  const LoginLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
          child: Center(
        child: CustomLoadingIndicator(),
      )),
    );
  }
}
