import 'package:flutter/material.dart';
import 'package:wasally/core/utils/size_config.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            const HorizintalSpace(1.7),
            CustomText(
              text: '$title :  ',
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.defaultSize! * 2,
            ),
            Flexible(
                child: CustomText(
              text: value,
              fontSize: SizeConfig.defaultSize! * 2,
            )),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
