import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../complete_order/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'complete_location_initial_section.dart';
import 'complete_location_success_section.dart';
import 'complete_order_location_loading_section.dart';

class BlocBuilderLocationButton extends StatelessWidget {
  const BlocBuilderLocationButton({
    super.key,
    required this.accessLocationCubit,
  });

  final CompleteOrderGetLocationCubit accessLocationCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteOrderGetLocationCubit,
        CompleteOrderGetLocationState>(
      listener: (context, state) {
        if (state is CompleteOrderGetLocationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(AppStrings.thereWasAnError.tr()),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CompleteOrderGetLocationSuccess) {
          return const CompleteLocationSuccessSection();
        } else if (state is CompleteOrderGetLocationLoading) {
          return const CompleteOrderLocationLoadingSection();
        } else {
          return CompleteLocationInitialSection(
              accessLocationCubit: accessLocationCubit);
        }
      },
    );
  }
}
