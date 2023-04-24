import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:get/get.dart' hide Trans;
import '../../../../../core/widgets/costum_text_field.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/signup_cubit/signup_cubit.dart';
import 'custom_drop_down_button1.dart';
import 'package:easy_localization/easy_localization.dart';

class BuisenessSection extends StatelessWidget {
  const BuisenessSection({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCubit accessCubit = BlocProvider.of<SignupCubit>(context);

    return Column(
      children: [
        CustomDropDownButton1(
            onChanged: (index) {
              BlocProvider.of<SignupCubit>(context)
                  .selectAccount(selected: index);

              BlocProvider.of<SignupCubit>(context).category = index;
            },
            items: [
              AppStrings.restaurant.tr(),
              AppStrings.superMarket.tr(),
              AppStrings.pharmacy.tr(),
              AppStrings.bakery.tr(),
              AppStrings.vegetables.tr(),
              AppStrings.library.tr(),
            ],
            hintText: AppStrings.chooseCategory.tr()),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.name = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else {
              return null;
            }
          },
          hintText: AppStrings.shopName.tr(),
          prefixIcon: const Icon(Icons.add_business),
        ),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.address = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else {
              return null;
            }
          },
          hintText: AppStrings.address.tr(),
          prefixIcon: const Icon(Icons.location_on),
        ),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.phoneNumber = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else if (value.length < 11) {
              return AppStrings.phoneLessThan.tr();
            } else if (value.length > 11) {
              return AppStrings.phoneMoreThan.tr();
            }
          },
          hintText: AppStrings.phoneNumber.tr(),
          prefixIcon: const Icon(Icons.phone_android),
          textInputType: TextInputType.number,
        ),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.password = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fieldRequired.tr();
            } else if (value.length < 8) {
              return AppStrings.passwordMustBe.tr();
            } else {
              return null;
            }
          },
          hintText: AppStrings.password.tr(),
          prefixIcon: const Icon(Icons.lock_open),
          obscureText: true,
        ),
      ],
    );
  }
}
