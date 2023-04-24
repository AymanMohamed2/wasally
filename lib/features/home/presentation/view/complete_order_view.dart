import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/functions/custom_alert_dialog.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/person_cubit/person_cubit.dart';
import 'package:wasally/features/home/data/models/category_details_model/document.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_cubit/complete_order_cubit.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_view_body.dart';

import '../../../../core/widgets/custom_buttons.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../curved_navigation_bar/data/models/person_model/person_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

class CompleteOrderView extends StatelessWidget {
  CompleteOrderView({super.key, required this.title, this.document});
  final String title;
  final Document? document;
  final _formKey = GlobalKey<FormState>();
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    final UserInfoModel userInfo =
        BlocProvider.of<PersonCubit>(context).userInfo!;

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                print(userInfo.name);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
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
                    BlocProvider.of<CompleteOrderCubit>(context).postOrderAdmin(
                        name: userInfo.name!,
                        phone: userInfo.phone!,
                        categoryName: document!.categoryName!,
                        shopName: title,
                        order: accessCubit.order!);
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
                            name: userInfo.name!,
                            phone: userInfo.phone!,
                            categoryName: document!.categoryName!,
                            shopName: title,
                            order: accessCubit.order!);

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
                            name: userInfo.name!,
                            phone: userInfo.phone!,
                            categoryName: document!.categoryName!,
                            shopName: title,
                            order: accessCubit.order!);
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
    );
  }
}
