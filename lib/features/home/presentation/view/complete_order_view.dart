import 'package:flutter/material.dart';
import 'package:wasally/features/home/presentation/widgets/complete_order_view_body.dart';

import '../../../../core/widgets/custom_buttons.dart';

class CompleteOrderView extends StatelessWidget {
  const CompleteOrderView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton:
          CostumButtonSignUp(onTap: () {}, text: 'Wasally', padding: 25),
      body: const CompleteOrderViewBody(),
    );
  }
}
