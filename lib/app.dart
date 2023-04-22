import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Wasally extends StatelessWidget {
  Wasally({this.email, this.password, super.key});
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).email = email;
    BlocProvider.of<SplashCubit>(context).password = password;
    return BlocProvider(
      create: (context) => LoginCubit(ApiServices()),
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
