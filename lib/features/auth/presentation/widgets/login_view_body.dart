import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/auth/presentation/view/sign_up_view.dart';
import '../../../../core/widgets/costum_text_field.dart';
import '../../../home/presentation/view/curved_navigation_bar.dart';
import 'custom_elevated_button.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const VirticalSpace(12),
            Image.asset(
              kLogo,
              height: SizeConfig.defaultSize! * 12,
            ),
            const VirticalSpace(6),
            CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field is required';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                email = value;
              },
              hintText: 'Email',
              prefixIcon: const Icon(Icons.mail),
              textInputType: TextInputType.emailAddress,
            ),
            const VirticalSpace(1),
            CustomTextField(
              errorMaxLines: 8,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field is required';
                } else if (value.length < 8) {
                  return 'password must be more than 8 character';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                password = value;
              },
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_open),
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
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Get.off(
                    () => const BottomNavigationBarHome(),
                  );
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
                  return const CustomElevatedButton(
                    child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  );
                } else {
                  return CustomElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email, password: password);
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
              },
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
                    Get.to(
                      () => const SignUp(),
                    );
                  },
                  child: const Text(
                    'register',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
