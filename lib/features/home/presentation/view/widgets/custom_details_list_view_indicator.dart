import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';
import 'custom_item_details_loading_indicator.dart';

class CustomDetailsListViewLoadingIndicator extends StatelessWidget {
  const CustomDetailsListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Expanded(
        child: SizedBox(
          child: ListView.builder(
            itemCount: 15,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const CustomItemDetailsLoadingIndicator();
            },
          ),
        ),
      ),
    );
  }
}
