import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/constants.dart';
import '../complete_order_view.dart';

class CustomItemDetailsView extends StatelessWidget {
  const CustomItemDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListTile(
        title: const Text('Test'),
        subtitle: const Text('Test'),
        leading: Container(
          height: 40,
          child: Image.asset(kLogo),
        ),
        trailing: const Icon(
          Icons.shopping_basket,
          color: kPrimaryColor,
        ),
        onTap: () {
          Get.to(
            () => const CompleteOrderView(
              title: 'bab el 7ara',
            ),
          );
        },
      ),
    );
  }
}
