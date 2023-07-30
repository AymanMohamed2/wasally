import 'package:flutter/material.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/old_orders_view_body.dart';

class OldOrdersView extends StatelessWidget {
  const OldOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OldOrdersViewBody(),
    );
  }
}
