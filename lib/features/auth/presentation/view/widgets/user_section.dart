import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return 'this field is required';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.name = value;
          },
          hintText: 'Name',
          prefixIcon: const Icon(Icons.person),
        ),
        const VirticalSpace(1),
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.phoneNumber = value;
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'this field is required';
            } else if (value.length < 8) {
              return 'Password must be more than 8 character';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            accessCubit.password = value;
          },
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock_open),
          obscureText: true,
        ),
      ],
    );
  }
}
