import 'package:cool_alert/cool_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/get_current_orders_cubit/get_current_orders_cubit.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/functions/custom_error_snake_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/order_model/document.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Visibility(
        visible: document.orderState == 'تم التوصيل' ||
                document.orderState == 'توصيل'
            ? true
            : false,
        child: BlocConsumer<GetCurrentOrdersCubit, GetCurrentOrdersState>(
          listener: (context, state) async {
            if (state is DeleteOrderSuccess) {
              showSnakeBar(context,
                  message: AppStrings.orderDeleteSuccesfully.tr());
            } else if (state is DeleteOrderFailure) {
              showSnakeBar(context, message: state.errMessage);
            }
          },
          builder: (context, state) {
            return IconButton(
              onPressed: () async {
                customAlertDialog(context,
                    cancelBtnColor: Colors.black,
                    title: AppStrings.areYouSure.tr(),
                    text: AppStrings.youWantToDeleteThisOrder.tr(),
                    type: CoolAlertType.confirm, onConfirmBtnTap: () async {
                  await BlocProvider.of<GetCurrentOrdersCubit>(context)
                      .deleteOrder(orderId: document.id);
                }, onCancelBtnTap: () {});
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.all(0),
      leading: const Icon(
        Icons.category,
        color: kPrimaryColor,
      ),
      title: Row(children: [
        CustomText(
          text: '${AppStrings.category.tr()}  :  ',
          fontSize: SizeConfig.defaultSize! * 2,
          fontWeight: FontWeight.bold,
        ),
        Flexible(
          child: CustomText(
            text: document.categoryName!,
            fontSize: SizeConfig.defaultSize! * 2,
          ),
        ),
      ]),
    );
  }
}
