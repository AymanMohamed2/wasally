import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_buttons.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:wasally/features/auth/presentation/view/sign_up_view.dart';

import '../../../../../core/widgets/costum_text_field.dart';
import '../../../../home/presentation/view/curved_navigation_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const VirticalSpace(12),
          Image.asset(
            kLogo,
            height: SizeConfig.defaultSize! * 15,
          ),
          const VirticalSpace(6),
          const CustomTextField(
            hintText: 'Phone Number',
            prefixIcon: Icon(Icons.phone_android),
            textInputType: TextInputType.number,
          ),
          const VirticalSpace(1),
          const CustomTextField(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock_open),
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Forgot Password?',
              textAlign: TextAlign.end,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          CustomGeneralButton(
            onTap: () {
              Get.to(() => const BottomNavigationBarHome(),
                  transition: Transition.fadeIn);
            },
            text: 'Login',
          ),
          const VirticalSpace(1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUp(),
                      transition: Transition.rightToLeft);
                },
                child: const Text(
                  'sign up',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
