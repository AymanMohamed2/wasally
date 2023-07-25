import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../complete_order/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

class CompleteLocationInitialSection extends StatelessWidget {
  const CompleteLocationInitialSection({
    super.key,
    required this.accessLocationCubit,
  });

  final CompleteOrderGetLocationCubit accessLocationCubit;

  @override
  Widget build(BuildContext context) {
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
        await accessLocationCubit.getUserCurrentLocation();
      },
    );
  }
}
