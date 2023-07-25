import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_buttons.dart';

class CompleteLocationSuccessSection extends StatelessWidget {
  const CompleteLocationSuccessSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
