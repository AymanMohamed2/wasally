import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text.dart';

class CustomEditPhoneNumber extends StatelessWidget {
  const CustomEditPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: CustomText(
            text: AppStrings.editPhoneNumber.tr(),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
