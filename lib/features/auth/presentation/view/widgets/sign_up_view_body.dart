import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';
import 'package:wasally/features/auth/presentation/view/widgets/custom_elevated_button.dart';
import 'package:wasally/features/auth/presentation/view/widgets/user_section.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/costum_text_field.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/signup_cubit/signup_cubit.dart';
import 'buiseness_section.dart';
import 'custom_drop_down_button1.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignupCubit accessCubit = BlocProvider.of<SignupCubit>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/register_image.png',
              height: SizeConfig.defaultSize! * 30,
            ),
            CustomDropDownButton1(
                onChanged: (index) {
                  BlocProvider.of<SignupCubit>(context)
                      .selectAccount(selected: index);

                  BlocProvider.of<SignupCubit>(context).accountType = index;
                },
                items: const [
                  'Buiseness Account',
                  'User Account',
                ],
                hintText: 'Please Choose account Type'),
            const VirticalSpace(1),
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                if (state is BuisenessUserState) {
                  return const BuisenessSection();
                } else {
                  return const UserSection();
                }
              },
            ),
            const VirticalSpace(3),
            BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  Get.to(() => const LoginView());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('Account Created Successfully 🥳'),
                    ),
                  );
                } else if (state is SignUpFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: Text(state.errMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is SignUpLoadingState) {
                  return const CustomElevatedButton(
                    child: CustomLoadingIndicator(),
                  );
                } else {
                  return CustomElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await BlocProvider.of<SignupCubit>(context).signupUser(
                          name: accessCubit.name!,
                          phoneNumber: accessCubit.phoneNumber!,
                          password: accessCubit.password!,
                          email: accessCubit.email!,
                        );
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
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
