import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';
import 'package:wasally/features/auth/presentation/widgets/custom_elevated_button.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/costum_text_field.dart';
import '../../../../core/widgets/space_widget.dart';
import '../manager/signup_cubit/signup_cubit.dart';
import 'custom_drop_down_button.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? phoneNumber;
    String? password;
    String? name;
    String? email;
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
            const CustomDropDownButton(
                items: ['Buiseness Account', 'User Account'],
                hintText: 'Please Choose account Type'),
            const VirticalSpace(1),
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                if (state is BuisenessUserState) {
                  return Column(
                    children: [
                      const CustomDropDownButton(
                          items: ['Buiseness Account', 'User Account'],
                          hintText: 'Choose Category'),
                      const VirticalSpace(1),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          } else {
                            return null;
                          }
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
                        hintText: 'Phone Number',
                        prefixIcon: const Icon(Icons.phone_android),
                        textInputType: TextInputType.number,
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
                          email = value;
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
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_open),
                        obscureText: true,
                      ),
                    ],
                  );
                } else {
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
                          name = value;
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
                          phoneNumber = value;
                        },
                        hintText: 'Phone Number',
                        prefixIcon: const Icon(Icons.phone_android),
                        textInputType: TextInputType.number,
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
                          email = value;
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
                          password = value;
                        },
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_open),
                        obscureText: true,
                      ),
                    ],
                  );
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
                      content: Text('Nice Account Created '),
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
                    child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  return CustomElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await BlocProvider.of<SignupCubit>(context).signupUser(
                          name: name!,
                          phoneNumber: phoneNumber!,
                          password: password!,
                          email: email!,
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
