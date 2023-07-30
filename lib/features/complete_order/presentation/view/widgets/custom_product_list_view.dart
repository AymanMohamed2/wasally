import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'package:wasally/features/complete_order/presentation/manager/fetch_products_cubit/fetch_products_cubit.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../data/models/product_model/document.dart';
import 'custom_product_item.dart';

class CustomProductListView extends StatefulWidget {
  const CustomProductListView({
    super.key,
    required this.productsList,
  });
  final List<Document> productsList;

  @override
  State<CustomProductListView> createState() => _CustomProductListViewState();
}

class _CustomProductListViewState extends State<CustomProductListView> {
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
        await BlocProvider.of<FetchProductsCubit>(context).fetchShopProducts(
            pageNumber: nextPage++,
            shopId: BlocProvider.of<CompleteOrderCubit>(context).document!.id!);

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
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Expanded(
        child: GridView.builder(
          controller: _scrollController,
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: SizeConfig.defaultSize! * 1,
              crossAxisSpacing: SizeConfig.defaultSize! * 1),
          itemCount: widget.productsList.length,
          itemBuilder: (context, index) {
            return CustomProductItem(
              document: widget.productsList[index],
            );
          },
        ),
      ),
    );
  }
}
