import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
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

  // Future<void> openGoogleMaps(double endLatitude, double endLongitude) async {
  //   Position position = await getUserCurrentLocation();
  //   String text = "Hello World !! Hey There";
  //   String url =
  //       "https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=$endLatitude,$endLongitude&travelmode=driving/?text=${Uri.encodeFull(text)}";
  //   final String googleMapsUrl = url;

  //   if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
  //     await launchUrl(Uri.parse(googleMapsUrl),
  //         mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not launch $googleMapsUrl';
  //   }
  // }

  Future<Position> getUserCurrentLocation() async {
    Position position;
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });

    position = await Geolocator.getCurrentPosition();

    return position;
  }
}
