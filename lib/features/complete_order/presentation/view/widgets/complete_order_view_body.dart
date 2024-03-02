import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import '../../../../complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../../../../complete_order/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'bloc_builder_location_button.dart';
import 'complete_order_write_order_section.dart';

// ignore: must_be_immutable
class CompleteOrderViewBody extends StatelessWidget {
  CompleteOrderViewBody({
    super.key,
    required this.controller,
    required this.catigoryName,
  });
  final TextEditingController controller;
  Position? position;
  final String catigoryName;

  @override
  Widget build(BuildContext context) {
    CompleteOrderCubit accessCubit =
        BlocProvider.of<CompleteOrderCubit>(context);
    CompleteOrderGetLocationCubit accessLocationCubit =
        BlocProvider.of<CompleteOrderGetLocationCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CompleteOrderWriteOrderSection(
          controller: controller,
          accessCubit: accessCubit,
        ),
        BlocBuilderLocationButton(accessLocationCubit: accessLocationCubit),
        const VirticalSpace(2),
        // MenuAndImagePickerBuilder(catigoryName: catigoryName),
      ],
    );
  }
}
