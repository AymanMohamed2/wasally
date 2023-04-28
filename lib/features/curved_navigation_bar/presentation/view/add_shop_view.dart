import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:wasally/features/curved_navigation_bar/data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo_impl.dart';

import '../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'widgets/add_shop_view_body.dart';
import '../manager/add_shop_cubit/add_shop_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddShopCubit(CurvedNavigationBarRepoImpl(ApiServices(Dio()))),
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
