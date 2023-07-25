import 'package:flutter/material.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/product_list_view_bloc_builder.dart';

import 'pick_image_bloc_consumer.dart';
import 'custom_text_menu.dart';

class MenuAndImagePickerBuilder extends StatelessWidget {
  const MenuAndImagePickerBuilder({
    super.key,
    required this.catigoryName,
  });

  final String catigoryName;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (catigoryName == 'Restaurant' || catigoryName == 'مطعم') {
        return const Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextMenu(),
                ProductsListViewBlocBuilder(),
              ],
            ),
          ),
        );
      } else {
        return const Expanded(
            child: SizedBox(
                child: SingleChildScrollView(child: PickImageBlocConsumer())));
      }
    });
  }
}
