import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'custom_product_item.dart';

class CustomProductListView extends StatefulWidget {
  const CustomProductListView({
    super.key,
  });

  @override
  State<CustomProductListView> createState() => _CustomProductListViewState();
}

class _CustomProductListViewState extends State<CustomProductListView> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 65, top: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: BlocProvider.of<CompleteOrderCubit>(context)
                .document!
                .shopCategories!
                .length,
            itemBuilder: (context, index) {
              return CustomProductItem(
                category: BlocProvider.of<CompleteOrderCubit>(context)
                    .document!
                    .shopCategories![index],
              );
            },
          ),
        ),
      ),
    );
  }
}
