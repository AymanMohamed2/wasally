import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_buttons.dart';

class CompleteOrderLocationLoadingSection extends StatelessWidget {
  const CompleteOrderLocationLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonGetPosition(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.getpossition.tr(),
              style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5),
            ),
            const CustomLoadingIndicator()
          ],
        ),
        leading: const Icon(Icons.location_pin),
        iconColor: Colors.orange,
      ),
    );
  }
}
