import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/custom_product_list_view.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../complete_order/presentation/manager/fetch_products_cubit/fetch_products_cubit.dart';

class ProductsListViewBlocBuilder extends StatelessWidget {
  const ProductsListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchProductsCubit, FetchProductsState>(
      listener: (context, state) {
        if (state is FetchProductsSuccess) {
          BlocProvider.of<FetchProductsCubit>(context)
              .productsList
              .addAll(state.productsList);
        }
      },
      builder: (context, state) {
        if (state is FetchProductsSuccess ||
            state is FetchProductsPaginationLoading ||
            state is FetchProductsPaginationFailure) {
          // ignore: prefer_is_empty
          if (BlocProvider.of<FetchProductsCubit>(context)
              .productsList
              .isNotEmpty) {
            return CustomProductListView(
              productsList:
                  BlocProvider.of<FetchProductsCubit>(context).productsList,
            );
          } else {
            return Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child:
                    Center(child: CustomText(text: AppStrings.noProducts.tr())),
              ),
            );
          }
        } else if (state is FetchProductsFailure) {
          return Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Center(
                  child: CustomText(
                      text: state.errMessage ==
                              "AppwriteException: null, Failed host lookup: 'cloud.appwrite.io' (0)"
                          ? 'No Internet Connection 🌐'
                          : state.errMessage)),
            ),
          );
        } else {
          return Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: const Center(
                  child: CustomLoadingIndicator(
                height: 30,
                width: 30,
                color: kPrimaryColor,
              )),
            ),
          );
        }
      },
    );
  }
}
