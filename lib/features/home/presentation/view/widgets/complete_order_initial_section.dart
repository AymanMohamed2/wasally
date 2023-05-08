import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../../data/models/category_details_model/document.dart';
import '../../manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../../manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

class CompleteOrderInitialSection extends StatelessWidget {
  const CompleteOrderInitialSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.accessVerifyCubit,
    required this.document,
    required this.title,
    required this.accessCubit,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final VerifyCubit accessVerifyCubit;
  final Document? document;
  final String title;
  final CompleteOrderCubit accessCubit;

  @override
  Widget build(BuildContext context) {
    return CostumButtonSignUp(
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            if (BlocProvider.of<CompleteOrderGetLocationCubit>(context)
                    .position !=
                null) {
              BlocProvider.of<CompleteOrderCubit>(context).postOrderAdmin(
                phone: accessVerifyCubit.userInfoModel!.phone!,
                categoryName: document!.categoryName!,
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
