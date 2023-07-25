import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/widgets/custom_text.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/product_details_view_body.dart';

import '../../data/models/product_model/document.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.document});
  final Document document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
          child: CustomText(text: 'Price : ${document.productPrice!} \$')),
      body: ProductDetailsViewBody(document: document),
    );
  }
}
