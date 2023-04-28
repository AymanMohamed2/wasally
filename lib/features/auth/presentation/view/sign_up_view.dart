import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:wasally/features/auth/data/repositories/signup_repo/sign_up_repo_impl.dart';

import '../manager/signup_cubit/signup_cubit.dart';
import '../manager/verify_cubit/verify_cubit.dart';
import 'widgets/sign_up_view_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(SignupRepoImpl(ApiServices(Dio()))),
        ),
        BlocProvider(
          create: (context) => VerifyCubit(AuthRepoImpl(ApiServices(Dio()))),
        ),
      ],
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
