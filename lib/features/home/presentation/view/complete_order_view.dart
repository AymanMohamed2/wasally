import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/functions/custom_alert_dialog.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/home/data/models/category_details_model/document.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_view_body.dart';

import '../../../../core/widgets/custom_buttons.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

import '../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../manager/complete_order_button_cubit/complete_order_button_cubit.dart';

class CompleteOrderView extends StatelessWidget {
  CompleteOrderView({
    super.key,
    required this.title,
    this.document,
  });
  final String title;
  final Document? document;

  final _formKey = GlobalKey<FormState>();

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    var accessVerifyCubit = BlocProvider.of<VerifyCubit>(context);

    return BlocProvider(
      create: (context) => CompleteOrderGetLocationCubit(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              CachedNetworkImage(
                imageUrl: document?.image ??
                    'https://cloud.appwrite.io/v1/storage/buckets/643e9b5eab2bf91195ff/files/643e9cf5d2553db8e9ad/view?project=6435d5e1a13eff6332c2&mode=admin',
              )
            ],
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          floatingActionButton:
              BlocConsumer<CompleteOrderCubit, CompleteOrderState>(
                  builder: (context, state) {
            if (state is CompleteOrderInitial) {
              return CostumButtonSignUp(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      if (BlocProvider.of<CompleteOrderGetLocationCubit>(
                                  context)
                              .position !=
                          null) {
                        BlocProvider.of<CompleteOrderCubit>(context).postOrderAdmin(
                            phone: accessVerifyCubit.userInfoModel!.phone!,
                            categoryName: document!.categoryName!,
                            shopName: title,
                            order: accessCubit.order!,
                            address:
                                '${BlocProvider.of<CompleteOrderGetLocationCubit>(context).position}');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content: Text(AppStrings.plsChooseLocation.tr()),
                          ),
                        );
                      }
                    }
                  },
                  text: AppStrings.wasally.tr(),
                  padding: 25);
            } else if (state is CompleteOrderSuccess) {
              return CostumButtonSignUp(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await BlocProvider.of<CompleteOrderCubit>(context)
                          .postOrderAdmin(
                              phone: accessVerifyCubit.verifyModel!.userId!,
                              categoryName: document!.categoryName!,
                              shopName: title,
                              order: accessCubit.order!,
                              address:
                                  '${BlocProvider.of<CompleteOrderGetLocationCubit>(context).position}');

                      _controller.clear();
                    }
                  },
                  text: AppStrings.wasally.tr(),
                  padding: 25);
            } else if (state is CompleteOrderFailure) {
              return CostumButtonSignUp(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await BlocProvider.of<CompleteOrderCubit>(context)
                          .postOrderAdmin(
                              phone: accessVerifyCubit.verifyModel!.userId!,
                              categoryName: document!.categoryName!,
                              shopName: title,
                              order: accessCubit.order!,
                              address:
                                  '${BlocProvider.of<CompleteOrderGetLocationCubit>(context).position}');
                    }
                  },
                  text: AppStrings.wasally.tr(),
                  padding: 25);
            } else {
              return const CustomElevatedButton(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: CustomLoadingIndicator(),
              );
            }
          }, listener: (context, state) {
            if (state is CompleteOrderSuccess) {
              customAlertDialog(
                context,
                showCancelBtn: false,
                title: AppStrings.orderSendSuccessfuly.tr(),
                text: AppStrings.orderWillArrive.tr(),
                type: CoolAlertType.success,
              );
              _controller.clear();
            } else if (state is CompleteOrderFailure) {
              customAlertDialog(
                context,
                showCancelBtn: false,
                title: 'Oops...',
                text: state.errMessage,
                type: CoolAlertType.error,
              );
            }
          }),
          body: CompleteOrderViewBody(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
