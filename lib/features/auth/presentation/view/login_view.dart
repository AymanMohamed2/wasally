import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/api_services.dart';

import '../manager/login_cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(ApiServices()),
        child: LoginViewBody(),
      ),
    );
  }
}
