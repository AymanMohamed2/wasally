import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasally/core/utils/size_config.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/costum_text_field.dart';
import '../../manager/complete_order_button_cubit/complete_order_button_cubit.dart';

class CompleteOrderWriteOrderSection extends StatelessWidget {
  const CompleteOrderWriteOrderSection(
      {super.key, required this.controller, required this.accessCubit});
  final TextEditingController controller;
  final CompleteOrderCubit accessCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.screenWidth! * 0.022,
        left: SizeConfig.screenWidth! * 0.022,
        top: SizeConfig.screenWidth! * 0.022,
      ),
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.3,
        child: Card(
          child: CustomTextField(
            textInputType: TextInputType.multiline,
            controller: controller,
            onChanged: (value) {
              accessCubit.order = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.plsWriteOrder.tr();
              } else {
                return null;
              }
            },
            hintText: AppStrings.writeYourOrder.tr(),
            minLines: 100,
            maxLines: 200,
          ),
        ),
      ),
    );
  }
}
