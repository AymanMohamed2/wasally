import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/features/home/presentation/view/widgets/custom_app_bar.dart';

import 'custom_list_view_details.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          CustomAppBar(
            icon: Icons.search,
            image: kLogo,
          ),
          CustomListViewDetails()
        ],
      ),
    );
  }
}
