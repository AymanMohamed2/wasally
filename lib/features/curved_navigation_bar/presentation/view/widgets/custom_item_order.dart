import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_elevated_button.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_google_map.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/order_model/document.dart';
import 'custom_list_tile.dart';
import 'custom_row.dart';
import 'order_state_delivery_section.dart';
import 'order_state_done_section.dart';
import 'order_state_waiting_section.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomItemOrder extends StatelessWidget {
  const CustomItemOrder({super.key, required this.document});
  final Document document;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                CustomListTile(document: document),
                CustomRow(
                  icon: Icons.storefront,
                  title: AppStrings.shop.tr(),
                  value: document.shopName!,
                ),
                CustomRow(
                    icon: Icons.shopping_cart,
                    title: AppStrings.order.tr(),
                    value: document.order!),
                Visibility(
                  visible: document.deliveryPhone == null ? false : true,
                  child: CustomRow(
                    icon: Icons.phone_android,
                    title: AppStrings.deliveryPhone.tr(),
                    value: document.deliveryPhone ?? '',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.3,
                  child: CustomElevatedButton(
                    color: kPrimaryColor,
                    onPressed: () async {
                      double latitude = double.parse(document.latitude);
                      double longitude = double.parse(document.longtude);
                      Get.to(() => CustomGoogleMap(
                            latitude: latitude,
                            longtude: longitude,
                          ));
                    },
                    child: CustomText(
                      text: AppStrings.location.tr(),
                      fontSize: 15,
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  if (document.orderState == 'توصيل') {
                    return OrderStateDeliverySection(document: document);
                  } else if (document.orderState == 'جاري التوصيل') {
                    return OrderStateWaitingSection(document: document);
                  } else {
                    return const OrderStateDoneSection();
                  }
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
