import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../../home/presentation/view/widgets/custom_app_bar.dart';

class OldOrdersViewBody extends StatelessWidget {
  const OldOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          VirticalSpace(1),
          CustomAppBar(
            logo: kLogo,
            image: appBarImage,
          ),
        ],
      ),
    );
  }
}
