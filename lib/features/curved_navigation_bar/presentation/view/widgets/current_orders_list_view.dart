import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_model/document.dart';
import '../../manager/get_current_orders_cubit/get_current_orders_cubit.dart';
import 'custom_item_order.dart';

class CurrentOrdersListView extends StatefulWidget {
  const CurrentOrdersListView({
    super.key,
    required this.orderList,
  });
  final List<Document> orderList;

  @override
  State<CurrentOrdersListView> createState() => _CurrentOrdersListViewState();
}

class _CurrentOrdersListViewState extends State<CurrentOrdersListView> {
  late final ScrollController _scrollController;

  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<GetCurrentOrdersCubit>(context)
            .getCurrentOrders(pageNumber: nextPage++);

        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.orderList.length,
          itemBuilder: (context, index) {
            return CustomItemOrder(
              document: widget.orderList[index],
            );
          }),
    );
  }
}
