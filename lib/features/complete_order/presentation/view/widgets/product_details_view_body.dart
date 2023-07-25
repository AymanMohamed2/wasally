import 'package:flutter/material.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/product_details_image_section.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/product_details_section.dart';
import '../../../../complete_order/data/models/product_model/document.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.document});
  final Document document;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsImageSection(document: document),
          const Divider(),
          ProductDetailsSection(document: document),
        ],
      ),
    );
  }
}
