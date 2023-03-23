import 'package:flutter/material.dart';
import 'package:wasally/core/widgets/custom_buttons.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/costum_text_field.dart';
import '../../../../core/widgets/space_widget.dart';
import 'custom_drop_down_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const VirticalSpace(10),
          Image.asset(
            kLogo,
            height: SizeConfig.defaultSize! * 18,
          ),
          const CustomDropDownButton(),
          const VirticalSpace(1),
          const CustomTextField(
            hintText: 'Name',
            prefixIcon: Icon(Icons.person),
          ),
          const VirticalSpace(1),
          const CustomTextField(
            hintText: 'Phone Number',
            prefixIcon: Icon(Icons.phone_android),
            textInputType: TextInputType.number,
          ),
          const VirticalSpace(1),
          const CustomTextField(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock_open),
            obscureText: true,
          ),
          const VirticalSpace(3),
          const CustomGeneralButton(text: 'Sign Up'),
        ],
      ),
    );
  }
}
