import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wasally/core/utils/service_locator.dart';
import 'package:wasally/features/complete_order/data/repositories/complete_order_repo_Impl.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../../../../complete_order/presentation/manager/fetch_products_cubit/fetch_products_cubit.dart';
import '../../../data/models/category_details_model/document.dart';
import '../../../../complete_order/presentation/view/complete_order_view.dart';

class CustomItemDetailsView extends StatelessWidget {
  const CustomItemDetailsView({
    Key? key,
    this.document,
  }) : super(key: key);

  final Document? document;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListTile(
        title: Text(document!.name!),
        subtitle: Text(document!.address!),
        leading: SizedBox(
            height: 40,
            width: 40,
            child: CachedNetworkImage(imageUrl: document!.image!)),
        trailing: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
        onTap: () {
          Get.to(
            () => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CompleteOrderCubit(
                    getIt.get<CompleteOrderRepoImpl>(),
                  )..document = document,
                ),
                BlocProvider(
                  create: (context) => FetchProductsCubit(
                    getIt.get<CompleteOrderRepoImpl>(),
                  )..fetchShopProducts(shopId: document!.id!),
                ),
              ],
              child: CompleteOrderView(
                categoryName: AppStrings.restaurant.tr(),
                title: document!.name!,
                imageUrl: document!.image!,
              ),
            ),
          );
        },
      ),
    );
  }
}
