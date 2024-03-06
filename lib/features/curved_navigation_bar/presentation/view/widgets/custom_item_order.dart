import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wasally/features/curved_navigation_bar/presentation/manager/get_current_orders_cubit/get_current_orders_cubit.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_elevated_button.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_google_map.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/order_model/document.dart';
import 'custom_image_viewer.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRow(
                    icon: Icons.category,
                    title: AppStrings.category.tr(),
                    value: document.categoryName!),
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
                    icon: Icons.person,
                    title: AppStrings.deliveryName.tr(),
                    value: document.deliveryName ?? '',
                  ),
                ),
                Visibility(
                  visible: document.deliveryPhone == null ? false : true,
                  child: CustomRow(
                    onTap: () {
                      BlocProvider.of<GetCurrentOrdersCubit>(context)
                          .makingPhoneCall(phone: document.deliveryPhone!);
                    },
                    icon: Icons.phone_android,
                    title: AppStrings.deliveryPhone.tr(),
                    value: document.deliveryPhone ?? '',
                  ),
                ),
                Visibility(
                  visible: document.price == null ? false : true,
                  child: CustomRow(
                    icon: Icons.currency_pound,
                    title: AppStrings.price.tr(),
                    value: '${document.price} 🪙',
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (document.orderImage != null) {
                      return ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(
                          Icons.image,
                          color: kPrimaryColor,
                        ),
                        title: CustomText(
                          text: '${AppStrings.image.tr()} :',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Get.to(() => CustomImageViewer(
                                  imageUrl: document.orderImage!,
                                ));
                          },
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: CachedNetworkImage(
                              imageUrl: document.orderImage!,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
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
