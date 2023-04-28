import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_elevated_button.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<VerifyCubit>(context);
    var accessLoginCubit = BlocProvider.of<LoginCubit>(context);
    final _formKey = GlobalKey<FormState>();
    String? virifictionCode;

    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.screenWidth! * 0.07,
            right: SizeConfig.screenWidth! * 0.07),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                kLogo,
                width: SizeConfig.screenWidth! * 0.5,
                height: SizeConfig.screenHeight! * 0.2,
              ),
              const VirticalSpace(2.5),
              const CustomText(
                text: 'Phone Verification',
                fontWeight: FontWeight.bold,
              ),
              const VirticalSpace(1.1),
              const CustomText(
                text: 'We need to register your phone without getting started!',
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
              const VirticalSpace(3.2),
              Pinput(
                readOnly: accessCubit.readOnly,
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  virifictionCode = value;
                  if (_formKey.currentState!.validate()) {
                    accessCubit.confirmPhoneSession(
                        userId: accessLoginCubit.loginModel!.userId,
                        secret: value);
                  }
                },
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return 'Please Complete Your Verifiction Code';
                  } else {
                    return null;
                  }
                },
              ),
              const VirticalSpace(2.2),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<VerifyCubit, VerifyState>(
                  listener: (context, state) async {
                    if (state is VerifySuccess) {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString(
                          'userId', accessLoginCubit.loginModel!.userId);
                      BlocProvider.of<SplashCubit>(context).userId =
                          state.loginModel.userId!;
                      Get.to(() => const BottomNavigationBarHome());
                    } else if (state is VerifyFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          content: Text(state.errMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyLoading) {
                      return CustomElevatedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth! * 0.3,
                              vertical: SizeConfig.screenWidth! * 0.04),
                          child: const Center(
                            child: CustomLoadingIndicator(),
                          ));
                    } else {
                      return CustomElevatedButton(
                        child: const CustomText(
                          text: 'Phone Verifiction',
                          fontSize: 16,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            accessCubit.confirmPhoneSession(
                                userId: accessLoginCubit.loginModel!.userId,
                                secret: virifictionCode!);
                          }
                        },
                      );
                    }
                  },
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const CustomText(
                      text: 'Edit Phone Number ?',
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
