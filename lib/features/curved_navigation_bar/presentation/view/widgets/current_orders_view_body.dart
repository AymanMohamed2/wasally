import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/custom_app_bar.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/get_current_orders_cubit/get_current_orders_cubit.dart';
import 'current_orders_list_view.dart';
import 'package:easy_localization/easy_localization.dart';

class CurrentOrdersViewBody extends StatefulWidget {
  const CurrentOrdersViewBody({super.key});

  @override
  State<CurrentOrdersViewBody> createState() => _CurrentOrdersViewBodyState();
}

class _CurrentOrdersViewBodyState extends State<CurrentOrdersViewBody> {
  late GetCurrentOrdersCubit getCurrentOrdersCubit;

  void updateUi() {
    setState(() {});
  }

  @override
  void initState() {
    BlocProvider.of<GetCurrentOrdersCubit>(context).updateUi = updateUi;
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
          BlocConsumer<GetCurrentOrdersCubit, GetCurrentOrdersState>(
            listener: (context, state) {
              if (state is GetUserOrderSuccess) {
                BlocProvider.of<GetCurrentOrdersCubit>(context)
                    .orderList
                    .addAll(state.orderList);
              } else if (state is GetUserOrderPaginationLoading) {
                setState(() {});
              }
            },
            builder: (context, state) {
              if (state is GetUserOrderSuccess ||
                  state is GetUserOrderPaginationLoading ||
                  state is DeleteOrderSuccess ||
                  state is DeleteOrderFailure ||
                  state is GetUserOrderPaginationFailure) {
                if (BlocProvider.of<GetCurrentOrdersCubit>(context)
                    .orderList
                    .isNotEmpty) {
                  return CurrentOrdersListView(
                    orderList: BlocProvider.of<GetCurrentOrdersCubit>(context)
                        .orderList,
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
