import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wasally/core/utils/app_strings.dart';

import '../../../../../core/widgets/costum_text_field.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/signup_cubit/signup_cubit.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCubit accessCubit = BlocProvider.of<SignupCubit>(context);
    return Column(
      children: [
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.name = value;
          },
          hintText: AppStrings.name.tr(),
          prefixIcon: const Icon(Icons.person),
        ),
        const VirticalSpace(1),
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.phoneNumber = value;
          },
          hintText: AppStrings.phoneNumber.tr(),
          prefixIcon: const Icon(Icons.phone_android),
          textInputType: TextInputType.number,
        ),
        const VirticalSpace(1),
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else if (value.length < 8) {
              return AppStrings.passwordMustBe.tr();
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.password = value;
          },
          hintText: AppStrings.password.tr(),
          prefixIcon: const Icon(Icons.lock_open),
          obscureText: true,
        ),
      ],
    );
  }
}
