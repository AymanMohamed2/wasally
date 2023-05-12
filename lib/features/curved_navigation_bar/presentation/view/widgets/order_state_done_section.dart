import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderStateDoneSection extends StatelessWidget {
  const OrderStateDoneSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      color: Colors.green,
      onPressed: () {},
      child: Row(
        children: [
          CustomText(
            text: AppStrings.delivered.tr(),
            fontSize: 15,
          ),
          const HorizintalSpace(1),
          const Icon(Icons.task_alt),
        ],
      ),
    );
  }
}
