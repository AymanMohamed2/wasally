import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/curved_navigation_bar/data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo_impl.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_cubit/complete_order_cubit.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/data/repositories/login_repo/login_repo_impl.dart';
import 'features/curved_navigation_bar/presentation/manager/person_cubit/person_cubit.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Wasally extends StatelessWidget {
  Wasally({this.phone, this.password, super.key});
  var phone;
  var password;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).email = phone;
    BlocProvider.of<SplashCubit>(context).password = password;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PersonCubit(
            CurvedNavigationBarRepoImpl(ApiServices(Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => LoginCubit(
            LoginRepoImpl(ApiServices(Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryDetailsCubit(
            HomeRepoImpl(ApiServices(Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => CompleteOrderCubit(
            HomeRepoImpl(ApiServices(Dio())),
          ),
        ),
      ],
      child: MediaQuery(
        data: const MediaQueryData(),
        child: GetMaterialApp(
          title: AppStrings.appName,
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        ),
      ),
    );
  }
}
