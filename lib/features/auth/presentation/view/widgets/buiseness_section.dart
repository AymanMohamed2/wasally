import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/costum_text_field.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/signup_cubit/signup_cubit.dart';
import 'custom_drop_down_button1.dart';

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
            items: const [
              'Restaurant',
              'Super Market',
              'Pharmacy',
              'Bakery and sweets',
              'Vegetables and Fruits',
              'Library',
            ],
            hintText: 'Choose Category'),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.name = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else {
              return null;
            }
          },
          hintText: 'Shop Name',
          prefixIcon: const Icon(Icons.add_business),
        ),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.address = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else {
              return null;
            }
          },
          hintText: 'Address',
          prefixIcon: const Icon(Icons.location_on),
        ),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.phoneNumber = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else {
              return null;
            }
          },
          hintText: 'Phone Number',
          prefixIcon: const Icon(Icons.phone_android),
          textInputType: TextInputType.number,
        ),
        const VirticalSpace(1),
        CustomTextField(
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.email = value;
          },
          hintText: 'Email',
          prefixIcon: const Icon(Icons.mail),
        ),
        const VirticalSpace(1),
        CustomTextField(
          onChanged: (value) {
            accessCubit.password = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else if (value.length < 8) {
              return 'Password must be more than 8 character';
            } else {
              return null;
            }
          },
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock_open),
          obscureText: true,
        ),
      ],
    );
  }
}
