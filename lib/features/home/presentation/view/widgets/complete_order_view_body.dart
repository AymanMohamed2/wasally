import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasally/core/widgets/costum_text_field.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'package:wasally/features/home/presentation/view/widgets/custom_googlemap.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

import '../../manager/complete_order_button_cubit/complete_order_button_cubit.dart';

class CompleteOrderViewBody extends StatelessWidget {
  CompleteOrderViewBody({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  Position? position;

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    var accessLocationCubit =
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
        BlocBuilder<CompleteOrderGetLocationCubit,
            CompleteOrderGetLocationState>(
          builder: (context, state) {
            if (state is CompleteOrderGetLocationSuccess) {
              return CustomButtonGetPosition(
                child: ListTile(
                  title: Text(
                    AppStrings.locationSuccessfuly.tr(),
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
                  accessLocationCubit.getUserCurrentLocation();
                  Get.to(() => const CustomGoogleMap());
                },
              );
            }
          },
        )
      ],
    );
  }
}
