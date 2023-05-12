import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/features/home/presentation/view/category_details_view.dart';
import 'package:wasally/features/home/presentation/view/complete_order_view.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../curved_navigation_bar/data/models/order_model/document.dart';
import '../../../../curved_navigation_bar/data/models/order_model/order_model.dart';
import 'custom_item_home.dart';

class CustomGrideView extends StatelessWidget {
  const CustomGrideView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
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
                  title: AppStrings.restaurant.tr(),
                  collectionId: '643fff738de6a968c5ba',
                ),
              );
            },
            name: AppStrings.restaurant.tr(),
            imageUrl: kServiceRestaurant,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CategoryDetailsView(
                  title: AppStrings.superMarket.tr(),
                  collectionId: '64405ac2df4dd40f4524',
                ),
              );
            },
            name: AppStrings.superMarket.tr(),
            imageUrl: kServiceSuperMarket,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CategoryDetailsView(
                  title: AppStrings.pharmacy.tr(),
                  collectionId: '643cc36ba7aa0f87942e',
                ),
              );
            },
            name: AppStrings.pharmacy.tr(),
            imageUrl: kServicePharmacy,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CategoryDetailsView(
                  title: AppStrings.bakery.tr(),
                  collectionId: '64405c5d508f5a87af04',
                ),
              );
            },
            name: AppStrings.bakery.tr(),
            imageUrl: kServiceBakery,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CategoryDetailsView(
                  title: AppStrings.vegetables.tr(),
                  collectionId: '64405cdd6349581b8a59',
                ),
              );
            },
            name: AppStrings.vegetables.tr(),
            imageUrl: kServiceVegetables,
          ),
          CustomItemHomeView(
            onTap: () async {
            

              Get.to(
                () => CategoryDetailsView(
                  title: AppStrings.library.tr(),
                  collectionId: '64405d822764430f3f55',
                ),
              );
            },
            name: AppStrings.library.tr(),
            imageUrl: kServiceLibrary,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CompleteOrderView(
                  title: AppStrings.other.tr(),
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
