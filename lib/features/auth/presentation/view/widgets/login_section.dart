import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/costum_text_field.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginSection extends StatelessWidget {
  const LoginSection(
      {super.key, required this.controller, required this.accessCubit});
  final TextEditingController controller;
  final LoginCubit accessCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VirticalSpace(15),
        Image.asset(
          kLogo,
          width: SizeConfig.screenWidth! * 0.5,
          height: SizeConfig.screenHeight! * 0.2,
        ),
        const VirticalSpace(2),
        Text(
          AppStrings.phoneVerifiction.tr(),
          style: TextStyle(
              fontSize: SizeConfig.screenHeight! * 0.03,
              fontWeight: FontWeight.bold),
        ),
        const VirticalSpace(1),
        Text(
          AppStrings.subTitleLogin.tr(),
          style: TextStyle(
            fontSize: SizeConfig.screenHeight! * 0.02,
          ),
          textAlign: TextAlign.center,
        ),
        const VirticalSpace(3),
        CustomTextField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else if (value.length < 11) {
              return AppStrings.phoneLessThan.tr();
            } else if (value.length > 11) {
              return AppStrings.phoneMoreThan.tr();
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.phone = value;
          },
          hintText: AppStrings.phoneNumber.tr(),
          prefixIcon: const Icon(Icons.phone_android),
          textInputType: TextInputType.number,
        ),
        const VirticalSpace(2),
      ],
    );
  }
}
