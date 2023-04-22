import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/features/home/presentation/view/category_details_view.dart';
import 'package:wasally/features/home/presentation/view/complete_order_view.dart';

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
            onTap: () async {
              Get.to(
                () => const CategoryDetailsView(
                  title: 'Restaurant',
                  collectionId: '643fff738de6a968c5ba',
                ),
              );
            },
            name: 'Restaurant',
            imageUrl: kServiceRestaurant,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => const CategoryDetailsView(
                  title: 'Super Market',
                  collectionId: '64405ac2df4dd40f4524',
                ),
              );
            },
            name: 'Super Market',
            imageUrl: kServiceSuperMarket,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => const CategoryDetailsView(
                  title: 'Pharmacy',
                  collectionId: '643cc36ba7aa0f87942e',
                ),
              );
            },
            name: 'Pharmacy',
            imageUrl: kServicePharmacy,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => const CategoryDetailsView(
                  title: 'Bakery',
                  collectionId: '64405c5d508f5a87af04',
                ),
              );
            },
            name: 'Bakery',
            imageUrl: kServiceBakery,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => const CategoryDetailsView(
                  title: 'Vegetables',
                  collectionId: '64405cdd6349581b8a59',
                ),
              );
            },
            name: 'Vegetables',
            imageUrl: kServiceVegetables,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => const CategoryDetailsView(
                  title: 'Library',
                  collectionId: '64405d822764430f3f55',
                ),
              );
            },
            name: 'Library',
            imageUrl: kServiceLibrary,
          ),
          CustomItemHomeView(
            onTap: () {
              Get.to(
                () => const CompleteOrderView(title: 'Other'),
              );
            },
            name: 'Other',
            imageUrl: kServiceOther,
          ),
        ],
      ),
    );
  }
}
