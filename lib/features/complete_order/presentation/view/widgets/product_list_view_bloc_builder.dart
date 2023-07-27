import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../complete_order/presentation/manager/fetch_products_cubit/fetch_products_cubit.dart';
import 'custom_product_item.dart';

class ProductsListViewBlocBuilder extends StatelessWidget {
  const ProductsListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProductsCubit, FetchProductsState>(
      builder: (context, state) {
        if (state is FetchProductsSuccess) {
          // ignore: prefer_is_empty
          if (BlocProvider.of<FetchProductsCubit>(context)
              .productsList!
              .isNotEmpty) {
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 1),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: SizeConfig.defaultSize! * 1,
                      crossAxisSpacing: SizeConfig.defaultSize! * 1),
                  itemCount: BlocProvider.of<FetchProductsCubit>(context)
                      .productsList!
                      .length,
                  itemBuilder: (context, index) {
                    return CustomProductItem(
                      document: BlocProvider.of<FetchProductsCubit>(context)
                          .productsList![index],
                    );
                  },
                ),
              ),
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
