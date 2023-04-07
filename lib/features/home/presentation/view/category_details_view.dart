import 'package:flutter/material.dart';

import 'package:wasally/features/home/presentation/widgets/category_details_body.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoryDetailsBody(),
    );
  }
}
