<<<<<<< HEAD
import 'package:easy_localization/easy_localization.dart';
=======
import 'package:dio/dio.dart';
>>>>>>> 002218a8b1526e42ae69ff1f6d723927d02c64df
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/core/utils/language_manager.dart';
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

class Wasally extends StatefulWidget {
  Wasally({this.phone, this.password, Key? key}) : super(key: key);
  final String? phone;
  final String? password;

  @override
  _WasallyState createState() => _WasallyState();
}

class _WasallyState extends State<Wasally> {
  @override
  void didChangeDependencies() {
    context.setLocale(arabicLocal);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).email = widget.phone;
    BlocProvider.of<SplashCubit>(context).password = widget.password;
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