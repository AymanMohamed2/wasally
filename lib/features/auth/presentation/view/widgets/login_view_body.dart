// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart' hide Trans;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wasally/core/constants.dart';
// import 'package:wasally/core/utils/app_strings.dart';
// import 'package:wasally/core/utils/size_config.dart';
// import 'package:wasally/core/widgets/space_widget.dart';
// import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
// import 'package:wasally/features/auth/presentation/view/sign_up_view.dart';
// import '../../../../../core/widgets/costum_text_field.dart';
// import '../../../../../core/widgets/custom_loading_indicator.dart';
// import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
// import '../../../../../core/widgets/custom_elevated_button.dart';

// class LoginViewBody extends StatelessWidget {
//   LoginViewBody({super.key});

//   final _formKey = GlobalKey<FormState>();
//   var _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     String? phone;
//     String? password;

//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: EdgeInsets.all(SizeConfig.defaultSize! * 2.5),
//         child: ListView(
//           children: [
//             const VirticalSpace(12),
//             Image.asset(
//               kLogo,
//               height: SizeConfig.defaultSize! * 12,
//             ),
//             const VirticalSpace(6),
//             CustomTextField(
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return AppStrings.fieldRequired.tr();
//                 } else if (value.length < 11) {
//                   return AppStrings.phoneLessThan.tr();
//                 } else if (value.length > 11) {
//                   return AppStrings.phoneMoreThan.tr();
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {
//                 phone = value;
//               },
//               hintText: AppStrings.phoneNumber.tr(),
//               prefixIcon: const Icon(Icons.phone_android),
//               textInputType: TextInputType.number,
//             ),
//             const VirticalSpace(1),
//             CustomTextField(
//               errorMaxLines: 8,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return AppStrings.fieldRequired.tr();
//                 } else if (value.length < 8) {
//                   return AppStrings.passwordMustBe.tr();
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {
//                 password = value;
//               },
//               hintText: AppStrings.password.tr(),
//               prefixIcon: const Icon(Icons.lock_open),
//               textInputType: TextInputType.text,
//               obscureText: true,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 AppStrings.forgotPassword.tr(),
//                 textAlign: TextAlign.end,
//                 style: const TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             ),
//             BlocConsumer<LoginCubit, LoginState>(
//               listener: (context, state) async {
//                 if (state is LoginSuccessState) {
//                   SharedPreferences pref =
//                       await SharedPreferences.getInstance();
//                   pref.setString('userId', state.user.userId);

//                   Get.off(
//                     () => const BottomNavigationBarHome(),
//                   );
//                 } else if (state is LoginFailureState) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       duration: const Duration(seconds: 2),
//                       content: Text(state.errMessage),
//                     ),
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 if (state is LoginLoadingState) {
//                   return const CustomElevatedButton(
//                     child: CustomLoadingIndicator(),
//                   );
//                 } else {
//                   return CustomElevatedButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         await BlocProvider.of<LoginCubit>(context)
//                             .loginUser(email: phone, password: password);

//                       }
//                     },
//                     child: Text(
//                       AppStrings.login.tr(),
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                   );
//                 }
//               },
//             ),
//             const VirticalSpace(1),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   AppStrings.dontHaveAccount.tr(),
//                   style: const TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(
//                       () => const SignUp(),
//                     );
//                   },
//                   child: Text(
//                     AppStrings.register.tr(),
//                     style: const TextStyle(color: Colors.orange),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../verify_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<LoginCubit>(context);
    TextEditingController controller = TextEditingController();
    String? phoneNumber;

    return Container(
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
            const VirticalSpace(2),
            const Text(
              "Phone Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const VirticalSpace(1),
            const Text(
              "We need to register your phone without getting started!",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const VirticalSpace(3),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HorizintalSpace(1.5),
                  SizedBox(
                      width: SizeConfig.screenWidth! * 0.1,
                      child: const Text('+2')),
                  const Text(
                    "|",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  const HorizintalSpace(1),
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                    ),
                    onChanged: (value) {
                      accessCubit.phone = value;
                    },
                  ))
                ],
              ),
            ),
            const VirticalSpace(2),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Get.to(() => const VerifyView());
                } else if (state is LoginFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: Text(state.errMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoadingState) {
                  return CustomElevatedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! * 0.3,
                          vertical: SizeConfig.screenWidth! * 0.04),
                      child: const Center(
                        child: CustomLoadingIndicator(),
                      ));
                } else {
                  return CustomElevatedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth! * 0.3,
                        vertical: SizeConfig.screenWidth! * 0.04),
                    child: const Text(
                      'Send the Code',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      await accessCubit.createPhoneSession(
                          phoneNumber: accessCubit.phone!);
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
