import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:wasally/features/home/data/models/category_details_model/shop_category.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.category,
  });
  final ShopCategory category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          Get.to(() => ImageViewer(
                image: category.categoryImage!,
              ));
        },
        // ignore: sized_box_for_whitespace
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: category.categoryImage!,
          ),
        ),
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return PinchZoom(
      maxScale: 2.5,
      child: CachedNetworkImage(imageUrl: image),
    );
  }
}
