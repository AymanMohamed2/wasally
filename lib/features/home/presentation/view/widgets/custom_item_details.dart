import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_details_model/document.dart';
import '../complete_order_view.dart';

class CustomItemDetailsView extends StatelessWidget {
  const CustomItemDetailsView({
    Key? key,
    this.document,
  }) : super(key: key);

  final Document? document;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListTile(
        title: Text(document!.name!),
        subtitle: Text(document!.address!),
        leading: SizedBox(
            height: 40,
            width: 40,
            child: CachedNetworkImage(imageUrl: document!.image!)),
        trailing: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
        onTap: () {
          print(document);
          Get.to(
            () => CompleteOrderView(
              title: document!.name!,
              document: document,
            ),
          );
        },
      ),
    );
  }
}
