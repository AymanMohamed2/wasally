import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasally/features/complete_order/presentation/view/product_details_view.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../complete_order/data/models/product_model/document.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.document,
  });
  final Document document;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      // ignore: sized_box_for_whitespace
      child: InkWell(
        onTap: () {
          Get.to(
              () => ProductDetailsView(
                    document: document,
                  ),
              transition: Transition.fadeIn);
        },
        // ignore: sized_box_for_whitespace
        child: Container(
          width: 10,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 2.5 / 2,
                child: CachedNetworkImage(
                  imageUrl: document.productImage!,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        text: document.productName!,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        text: '${document.productPrice!} \$',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
