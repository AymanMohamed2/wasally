import 'package:flutter/material.dart';

import 'pick_image_bloc_consumer.dart';

class MenuAndImagePickerBuilder extends StatelessWidget {
  const MenuAndImagePickerBuilder({
    super.key,
    required this.catigoryName,
  });

  final String catigoryName;

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: SizedBox(
            child: SingleChildScrollView(child: PickImageBlocConsumer())));
    // return Builder(builder: (context) {
    //   if (catigoryName == 'Restaurant' || catigoryName == 'مطعم') {
    //     return const Expanded(
    //       child: SizedBox(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             CustomTextMenu(),
    //             ProductsListViewBlocBuilder(),
    //           ],
    //         ),
    //       ),
    //     );
    //   } else {
    //     return const Expanded(
    //         child: SizedBox(
    //             child: SingleChildScrollView(child: PickImageBlocConsumer())));
    //   }
    // });
  }
}
