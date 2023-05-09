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
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.3,
        child: Card(
          child: CustomTextField(
            textInputType: TextInputType.text,
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
            minLines: 11,
            maxLines: 15,
          ),
        ),
      ),
    );
  }
}
