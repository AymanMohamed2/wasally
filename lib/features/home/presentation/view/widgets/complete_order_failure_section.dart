import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../../manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

class CompleteOrderFailureSection extends StatelessWidget {
  const CompleteOrderFailureSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.accessVerifyCubit,
    required this.title,
    required this.accessCubit,
    required this.categoryName,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final VerifyCubit accessVerifyCubit;
  final String title;
  final CompleteOrderCubit accessCubit;
  final String categoryName;
  Future<String> nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('phoneNumber')!;
  }

  @override
  Widget build(BuildContext context) {
    return CostumButtonSignUp(
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            if (BlocProvider.of<CompleteOrderGetLocationCubit>(context)
                    .position !=
                null) {
              nameRetriever().then((value) async {
                await BlocProvider.of<CompleteOrderCubit>(context)
                    .postOrderAdmin(
                  phone: value,
                  categoryName: categoryName,
                  shopName: title,
                  order: accessCubit.order!,
                  latitude:
                      BlocProvider.of<CompleteOrderGetLocationCubit>(context)
                          .position!
                          .latitude
                          .toString(),
                  longtude:
                      BlocProvider.of<CompleteOrderGetLocationCubit>(context)
                          .position!
                          .longitude
                          .toString(),
                );
              });
            } else {
              showSnakeBar(context, message: AppStrings.plsChooseLocation.tr());
            }
          }
        },
        text: AppStrings.wasally.tr(),
        padding: 25);
  }
}
