import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'features/curved_navigation_bar/data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo_impl.dart';
import 'features/curved_navigation_bar/presentation/manager/get_user_order_cubit/get_user_order_cubit.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/home/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Wasally extends StatelessWidget {
  const Wasally({
    Key? key,
    this.isLogin,
  }) : super(key: key);

  final bool? isLogin;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            AuthRepoImpl(ApiServices(Dio())),
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
        BlocProvider(
          create: (context) => CompleteOrderGetLocationCubit(),
        ),
        BlocProvider(
          create: (context) => VerifyCubit(AuthRepoImpl(ApiServices(Dio()))),
        ),
        BlocProvider(
          create: (context) => GetUserOrderCubit(
            CurvedNavigationBarRepoImpl(ApiServices(Dio())),
          ),
        ),
      ],
      child: GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppStrings.appName,
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: SplashView(
          isLogin: isLogin,
        ),
      ),
    );
  }
}
