import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wasally/core/constants.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/order_model/document.dart';
import 'custom_elevated_button.dart';
import 'custom_jumping_dots.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderStateDeliverySection extends StatelessWidget {
  const OrderStateDeliverySection({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {},
      color: kPrimaryColor,
      child: Row(
        children: [
          CustomText(
            text: AppStrings.waiting.tr(),
            fontSize: 15,
          ),
          const HorizintalSpace(1),
          const CustomJumpingDots(),
        ],
      ),
    );
  }
}
