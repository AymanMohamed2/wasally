import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/core/utils/language_manager.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/home/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Wasally extends StatefulWidget {
  Wasally({this.userId, Key? key}) : super(key: key);
  final String? userId;

  @override
  _WasallyState createState() => _WasallyState();
}

class _WasallyState extends State<Wasally> {
  @override
  void didChangeDependencies() {
    context.setLocale(englishLocal);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).userId = widget.userId;

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
      ],
      child: MediaQuery(
        data: const MediaQueryData(),
        child: GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: AppStrings.appName,
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        ),
      ),
    );
  }
}
