import 'package:flutter/material.dart';

import 'custom_item_details.dart';

class CustomListViewDetails extends StatelessWidget {
  const CustomListViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const CustomItemDetailsView();
          },
        ),
      ),
    );
  }
}
