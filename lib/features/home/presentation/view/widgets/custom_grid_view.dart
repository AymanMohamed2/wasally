import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/dependncy_injection/service_locator.dart';
import 'package:wasally/features/complete_order/data/repositories/complete_order_repo_Impl.dart';
import 'package:wasally/features/home/presentation/view/category_details_view.dart';
import 'package:wasally/features/complete_order/presentation/view/complete_order_view.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'custom_item_home.dart';

class CustomGrideView extends StatelessWidget {
  const CustomGrideView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: SizeConfig.defaultSize! * 1,
            crossAxisSpacing: SizeConfig.defaultSize! * 1),
        children: [
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CategoryDetailsView(
                  image: kServiceRestaurant,
                  title: AppStrings.restaurant.tr(),
                  collectionId: '658b4860ee0bd88f61ab',
                ),
              );
            },
            name: AppStrings.restaurant.tr(),
            imageUrl: kServiceRestaurant,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => BlocProvider(
                  create: (context) =>
                      CompleteOrderCubit(getIt.get<CompleteOrderRepoImpl>()),
                  child: CompleteOrderView(
                    categoryName: AppStrings.superMarket.tr(),
                    title: AppStrings.superMarket.tr(),
                    imageUrl: kServiceSuperMarket,
                  ),
                ),
              );
            },
            name: AppStrings.superMarket.tr(),
            imageUrl: kServiceSuperMarket,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(() => BlocProvider(
                    create: (context) =>
                        CompleteOrderCubit(getIt.get<CompleteOrderRepoImpl>()),
                    child: CompleteOrderView(
                        categoryName: AppStrings.pharmacy.tr(),
                        title: AppStrings.pharmacy.tr(),
                        imageUrl: kServicePharmacy),
                  ));
            },
            name: AppStrings.pharmacy.tr(),
            imageUrl: kServicePharmacy,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(() => BlocProvider(
                    create: (context) =>
                        CompleteOrderCubit(getIt.get<CompleteOrderRepoImpl>()),
                    child: CompleteOrderView(
                        categoryName: AppStrings.bakery.tr(),
                        title: AppStrings.bakery.tr(),
                        imageUrl: kServiceBakery),
                  ));
            },
            name: AppStrings.bakery.tr(),
            imageUrl: kServiceBakery,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(() => BlocProvider(
                    create: (context) =>
                        CompleteOrderCubit(getIt.get<CompleteOrderRepoImpl>()),
                    child: CompleteOrderView(
                        categoryName: AppStrings.vegetables.tr(),
                        title: AppStrings.vegetables.tr(),
                        imageUrl: kServiceVegetables),
                  ));
            },
            name: AppStrings.vegetables.tr(),
            imageUrl: kServiceVegetables,
          ),
          CustomItemHomeView(
            onTap: () async {
              Get.to(() => BlocProvider(
                    create: (context) =>
                        CompleteOrderCubit(getIt.get<CompleteOrderRepoImpl>()),
                    child: CompleteOrderView(
                        categoryName: AppStrings.library.tr(),
                        title: AppStrings.library.tr(),
                        imageUrl: kServiceLibrary),
                  ));
            },
            name: AppStrings.library.tr(),
            imageUrl: kServiceLibrary,
          ),
          CustomItemHomeView(
            onTap: () async {
              Get.to(
                () => BlocProvider(
                  create: (context) =>
                      CompleteOrderCubit(getIt.get<CompleteOrderRepoImpl>()),
                  child: CompleteOrderView(
                    categoryName: AppStrings.other.tr(),
                    imageUrl: kServiceOther,
                    title: AppStrings.other.tr(),
                  ),
                ),
              );
            },
            name: AppStrings.other.tr(),
            imageUrl: kServiceOther,
          ),
        ],
      ),
    );
  }
}
