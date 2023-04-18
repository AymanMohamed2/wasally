import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/api_services.dart';

import '../manager/signup_cubit/signup_cubit.dart';
import '../widgets/sign_up_view_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(ApiServices()),
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
