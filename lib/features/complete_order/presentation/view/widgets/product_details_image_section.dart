import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../complete_order/data/models/product_model/document.dart';

class ProductDetailsImageSection extends StatelessWidget {
  const ProductDetailsImageSection({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: CachedNetworkImage(imageUrl: document.productImage!),
    );
  }
}
