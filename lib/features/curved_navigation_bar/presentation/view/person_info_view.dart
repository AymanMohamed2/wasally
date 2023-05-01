import 'package:flutter/material.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_elevated_button.dart';
import 'package:wasally/core/widgets/custom_text.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_add_shop_bottom_sheet.dart';

import 'widgets/person_info_view_body.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: SizeConfig.screenWidth! * 0.3,
        height: SizeConfig.screenHeight! * 0.05,
        child: CustomElevatedButton(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddShopBottomSheet();
              },
            );
          },
          child: const CustomText(
            text: 'اضافة مطعم',
            fontSize: 16,
          ),
        ),
      ),
      body: const PersonInfoViewBody(),
    );
  }
}
