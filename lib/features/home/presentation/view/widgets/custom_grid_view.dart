import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/features/home/presentation/view/category_details_view.dart';
import 'package:wasally/features/home/presentation/view/complete_order_view.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
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
                  image: kServiceRestaurant,
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
                () => CompleteOrderView(
                  title: AppStrings.superMarket.tr(),
                  imageUrl:
                      'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9cbd617494e7c8c6/view?project=6435d5e1a13eff6332c2&mode=admin',
                ),
              );
            },
            name: AppStrings.superMarket.tr(),
            imageUrl: kServiceSuperMarket,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(() => CompleteOrderView(
                  title: AppStrings.pharmacy.tr(),
                  imageUrl:
                      'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9cff19fc276d88df/view?project=6435d5e1a13eff6332c2&mode=admin'));
            },
            name: AppStrings.pharmacy.tr(),
            imageUrl: kServicePharmacy,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(() => CompleteOrderView(
                  title: AppStrings.bakery.tr(),
                  imageUrl:
                      'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9cc55ed1e30e61d9/view?project=6435d5e1a13eff6332c2&mode=admin'));
            },
            name: AppStrings.bakery.tr(),
            imageUrl: kServiceBakery,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(() => CompleteOrderView(
                  title: AppStrings.vegetables.tr(),
                  imageUrl:
                      'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9d08aaf0a92aa3c7/view?project=6435d5e1a13eff6332c2&mode=admin'));
            },
            name: AppStrings.vegetables.tr(),
            imageUrl: kServiceVegetables,
          ),
          CustomItemHomeView(
            onTap: () async {
              Get.to(() => CompleteOrderView(
                  title: AppStrings.library.tr(),
                  imageUrl:
                      'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9cb2ee061aa167c9/view?project=6435d5e1a13eff6332c2&mode=admin'));
            },
            name: AppStrings.library.tr(),
            imageUrl: kServiceLibrary,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => CompleteOrderView(
                  imageUrl:
                      'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9cf5d2553db8e9ad/view?project=6435d5e1a13eff6332c2&mode=admin',
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
