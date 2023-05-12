import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/get_user_order_cubit/get_user_order_cubit.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_app_bar.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'custom_item_order.dart';
import 'package:easy_localization/easy_localization.dart';

class TalbatViewBody extends StatefulWidget {
  const TalbatViewBody({super.key});

  @override
  State<TalbatViewBody> createState() => _TalbatViewBodyState();
}

class _TalbatViewBodyState extends State<TalbatViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(
            image: kLogo,
            icon: Icons.shopping_cart,
          ),
          CustomText(
            text: AppStrings.myOrders.tr(),
            fontWeight: FontWeight.bold,
          ),
          const VirticalSpace(1),
          BlocBuilder<GetUserOrderCubit, GetUserOrderState>(
            builder: (context, state) {
              if (state is GetUserOrderSuccess) {
                if (state.orderList.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.orderList.length,
                        itemBuilder: (context, index) {
                          return CustomItemOrder(
                            document: state.orderList[index],
                          );
                        }),
                  );
                } else {
                  return Column(children: [
                    const VirticalSpace(30),
                    CustomText(
                      text: AppStrings.noOrders.tr(),
                    ),
                  ]);
                }
              } else if (state is GetUserOrderFailure) {
                return Column(children: [
                  const VirticalSpace(30),
                  CustomText(
                    text: BlocProvider.of<GetUserOrderCubit>(context)
                            .errMessage ??
                        '',
                  ),
                ]);
              } else {
                return Column(children: const [
                  VirticalSpace(30),
                  CustomLoadingIndicator(
                    color: kPrimaryColor,
                    height: 30,
                    width: 30,
                  ),
                ]);
              }
            },
          )
        ],
      ),
    );
  }
}
