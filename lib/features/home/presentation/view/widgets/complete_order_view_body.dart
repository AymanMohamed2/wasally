import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/widgets/costum_text_field.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

import '../../manager/complete_order_button_cubit/complete_order_button_cubit.dart';

class CompleteOrderViewBody extends StatelessWidget {
  const CompleteOrderViewBody({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    var accessCubitLocation =
        BlocProvider.of<CompleteOrderGetLocationCubit>(context);
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Card(
            child: CustomTextField(
              textInputType: TextInputType.text,
              controller: controller,
              onChanged: (value) {
                accessCubit.order = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.plsWriteOrder.tr();
                } else {
                  return null;
                }
              },
              hintText: AppStrings.writeYourOrder.tr(),
              minLines: 10,
              maxLines: 15,
            ),
          ),
        ),
        BlocConsumer<CompleteOrderGetLocationCubit,
            CompleteOrderGetLocationState>(
          listener: (context, state) {
            if (state is CompleteOrderGetLocationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(state.errMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CompleteOrderGetLocationSuccess) {
              return CustomButtonGetPosition(
                child: ListTile(
                  title: Text(
                    state.currentAddress,
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                  leading: const Icon(Icons.location_pin),
                  iconColor: Colors.orange,
                ),
                onTap: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: Text(AppStrings.youAreAlreadyGetLocation.tr()),
                    ),
                  );
                },
              );
            } else if (state is CompleteOrderGetLocationFailure) {
              return CustomButtonGetPosition(
                child: ListTile(
                  title: Text(
                    AppStrings.getpossition.tr(),
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                  leading: const Icon(Icons.location_pin),
                  iconColor: Colors.orange,
                ),
                onTap: () async {
                  await accessCubitLocation.getCurrentPosition(context);
                },
              );
            } else if (state is CompleteOrderGetLocationLoading) {
              return const CustomButtonGetPosition(
                child: ListTile(
                  title: Center(
                    child: CustomLoadingIndicator(),
                  ),
                ),
              );
            } else {
              return CustomButtonGetPosition(
                child: ListTile(
                  title: Text(
                    AppStrings.getpossition.tr(),
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                  leading: const Icon(Icons.location_pin),
                  iconColor: Colors.orange,
                ),
                onTap: () async {
                  await accessCubitLocation.getCurrentPosition(context);
                },
              );
            }
          },
        )
      ],
    );
  }
}
