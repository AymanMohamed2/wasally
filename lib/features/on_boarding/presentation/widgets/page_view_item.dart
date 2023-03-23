import 'package:flutter/material.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VirticalSpace(12),
        Image.asset(
          image,
          height: SizeConfig.defaultSize! * 40,
          width: SizeConfig.defaultSize! * 43,
        ),
        const VirticalSpace(1.5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff2f2e41),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        const VirticalSpace(1),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff78787c),
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
