import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import '../../manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'complete_location_initial_section.dart';
import 'complete_location_success_section.dart';
import 'complete_order_write_order_section.dart';

class CompleteOrderViewBody extends StatelessWidget {
  CompleteOrderViewBody({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  Position? position;

  @override
  Widget build(BuildContext context) {
    CompleteOrderCubit accessCubit =
        BlocProvider.of<CompleteOrderCubit>(context);
    CompleteOrderGetLocationCubit accessLocationCubit =
        BlocProvider.of<CompleteOrderGetLocationCubit>(context);

    return ListView(
      children: [
        CompleteOrderWriteOrderSection(
          controller: controller,
          accessCubit: accessCubit,
        ),
        BlocBuilder<CompleteOrderGetLocationCubit,
            CompleteOrderGetLocationState>(
          builder: (context, state) {
            if (state is CompleteOrderGetLocationSuccess) {
              return const CompleteLocationSuccessSection();
            } else {
              return CompleteLocationInitialSection(
                  accessLocationCubit: accessLocationCubit);
            }
          },
        )
      ],
    );
  }
}
