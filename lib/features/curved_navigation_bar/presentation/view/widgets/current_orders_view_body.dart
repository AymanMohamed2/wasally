import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_app_bar.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/get_current_orders_cubit/get_current_orders_cubit.dart';
import 'custom_item_order.dart';
import 'package:easy_localization/easy_localization.dart';

class CurrentOrdersViewBody extends StatefulWidget {
  const CurrentOrdersViewBody({super.key});

  @override
  State<CurrentOrdersViewBody> createState() => _CurrentOrdersViewBodyState();
}

class _CurrentOrdersViewBodyState extends State<CurrentOrdersViewBody> {
  Future<String> nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('phoneNumber')!;
  }

  @override
  void initState() {
    nameRetriever().then((value) {
      BlocProvider.of<GetUserOrderCubit>(context)
          .getCurrentOrders(phoneNumber: value);
    });

    BlocProvider.of<GetUserOrderCubit>(context).getCurrentOrdersStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const VirticalSpace(1),
          const CustomAppBar(
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
                  return Expanded(
                    child: SizedBox(
                      child: Center(
                        child: CustomText(
                          text: AppStrings.noOrders.tr(),
                        ),
                      ),
                    ),
                  );
                }
              } else if (state is GetUserOrderFailure) {
                if (state.errMessage ==
                    "AppwriteException: null, Failed host lookup: 'cloud.appwrite.io' (0)") {
                  return Expanded(
                      child: SizedBox(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.noInternetImage),
                      const Text('No Internet Connection 🌐'),
                    ],
                  )));
                } else {
                  return Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(state.errMessage),
                      ),
                    ),
                  );
                }
              } else {
                return const Expanded(
                  child: SizedBox(
                    child: Center(
                      child: CustomLoadingIndicator(
                        color: kPrimaryColor,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
