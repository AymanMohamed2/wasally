import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../../complete_order/data/models/product_model/document.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.document});
  final Document document;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VirticalSpace(1),
                CustomText(
                  text: AppStrings.productName.tr(),
                  fontWeight: FontWeight.w500,
                ),
                const VirticalSpace(2),
                CustomText(
                  color: const Color.fromARGB(255, 121, 121, 121),
                  text: document.productName!,
                ),
                const VirticalSpace(4),
                CustomText(
                  text: AppStrings.descreption.tr(),
                  fontWeight: FontWeight.w500,
                ),
                const VirticalSpace(2),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.screenHeight! * 0.08),
                  child: CustomText(
                    text: document.productDescreption!,
                    color: const Color.fromARGB(255, 121, 121, 121),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
