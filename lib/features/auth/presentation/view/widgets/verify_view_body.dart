import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
import 'package:pinput/pinput.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_elevated_button.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VirticalSpace(15),
              Image.asset(
                kLogo,
                width: SizeConfig.screenWidth! * 0.5,
                height: SizeConfig.screenHeight! * 0.2,
              ),
              const VirticalSpace(2.5),
              CustomText(
                text: AppStrings.verifyCode.tr(),
                fontWeight: FontWeight.bold,
              ),
              const VirticalSpace(1.1),
              CustomText(
                text: AppStrings.subTitleVerificton.tr(),
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
                    return AppStrings.completeVerifyErrMessage.tr();
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
                      await pref.setString(
                          'userId', accessCubit.userInfoModel!.id!);
                      BlocProvider.of<SplashCubit>(context).userId =
                          state.loginModel.userId!;
                      Get.off(() => const BottomNavigationBarHome());
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
                        child: CustomText(
                          text: AppStrings.verify.tr(),
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
                    child: CustomText(
                      text: AppStrings.editPhoneNumber.tr(),
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
