import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../verify_view.dart';
import 'login_initial_section.dart';
import 'login_loading_section.dart';

class ButtonBlocBonsumer extends StatelessWidget {
  const ButtonBlocBonsumer({
    super.key,
    required this.formKey,
    required this.accessCubit,
  });

  final GlobalKey<FormState> formKey;
  final LoginCubit accessCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          SharedPreferences pref =
              await SharedPreferences.getInstance();
          pref.setString('userId', state.user.id);
          Get.to(() => const VerifyView());
        } else if (state is LoginFailureState) {
          showSnakeBar(context, message: '${state.errMessage}  ❌');
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const LoginLoadingSection();
        } else {
          return LoginInitialSection(
              formKey: formKey, accessCubit: accessCubit);
        }
      },
    );
  }
}