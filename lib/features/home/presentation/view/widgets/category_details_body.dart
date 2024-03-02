import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:wasally/features/home/presentation/view/widgets/custom_app_bar.dart';

import 'custom_list_view_details.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const VirticalSpace(1),
          CustomAppBar(
            logo: kLogo,
            image: image,
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
            child: Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.defaultSize! * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomListViewDetailsBlocBuilder(
            image: image,
          )
        ],
      ),
    );
  }
}
