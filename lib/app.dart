import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wasally/core/dependncy_injection/service_locator.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
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
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => VerifyCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          useInheritedMediaQuery: true,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: AppStrings.appName,
          theme: AppTheme.appTheme(),
          debugShowCheckedModeBanner: false,
          home: SplashView(
            isLogin: isLogin,
          ),
        ),
      ),
    );
  }
}
