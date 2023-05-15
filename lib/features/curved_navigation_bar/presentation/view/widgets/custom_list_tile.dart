import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../../data/models/order_model/document.dart';
import '../../manager/delete_order_cubit/delete_order_cubit.dart';
import '../../manager/get_user_order_cubit/get_user_order_cubit.dart';

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
        visible: document.orderState == 'تم التوصيل' ? true : false,
        child: BlocConsumer<DeleteOrderCubit, DeleteOrderState>(
          listener: (context, state) async {
            if (state is DeleteOrderSuccess) {
              await BlocProvider.of<GetUserOrderCubit>(context).getUserOrder(
                  phoneNumber: BlocProvider.of<VerifyCubit>(context)
                      .userInfoModel!
                      .phone!);
            } else if (state is DeleteOrderFailure) {
              showSnakeBar(context, message: state.errMessage);
            }
          },
          builder: (context, state) {
            if (state is DeleteOrderLoading) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: CustomLoadingIndicator(color: Colors.black),
              );
            } else {
              return IconButton(
                onPressed: () async {
                  await BlocProvider.of<DeleteOrderCubit>(context)
                      .deleteOrder(orderId: document.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              );
            }
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
