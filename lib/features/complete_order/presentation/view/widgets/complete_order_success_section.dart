import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../../../complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../../../../complete_order/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

class CompleteOrderSuccessSection extends StatelessWidget {
  const CompleteOrderSuccessSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.accessVerifyCubit,
    required this.title,
    required this.accessCubit,
    required TextEditingController controller,
    required this.categoryName,
  })  : _formKey = formKey,
        _controller = controller;

  final GlobalKey<FormState> _formKey;
  final VerifyCubit accessVerifyCubit;

  final String title;
  final CompleteOrderCubit accessCubit;
  final TextEditingController _controller;
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
                    .currentLocation !=
                null) {
              if (BlocProvider.of<CompleteOrderCubit>(context)
                  .isWithinWorkingHours()) {
                nameRetriever().then((value) async {
                  await BlocProvider.of<CompleteOrderCubit>(context)
                      .postOrderAdmin(
                    context: context,
                    phone: value,
                    categoryName: categoryName,
                    shopName: title,
                    order: accessCubit.order!,
                    latitude:
                        BlocProvider.of<CompleteOrderGetLocationCubit>(context)
                            .currentLocation!
                            .latitude
                            .toString(),
                    longtude:
                        BlocProvider.of<CompleteOrderGetLocationCubit>(context)
                            .currentLocation!
                            .longitude
                            .toString(),
                  );
                  _controller.clear();
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Text(AppStrings.workingTime.tr()),
                  ),
                );
              }
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
  }
}
