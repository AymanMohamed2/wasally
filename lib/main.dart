import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/app.dart';
import 'package:wasally/core/networking/api_services.dart';
import 'package:wasally/core/services/notification/one_signal/one_signal.dart';
import 'package:wasally/features/home/data/repositories/home_repo_impl.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';
import 'core/utils/language_manager.dart';
import 'core/dependncy_injection/service_locator.dart';
import 'features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  OneSignalService.initOneSignal();
  setup();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogin = prefs.getBool("isLogin");

  //test commit
  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocal, englishLocal],
      path: assetPathLocalization,
      child: Phoenix(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SplashCubit()),
            BlocProvider(
              create: (context) => SliderCubit(
                HomeRepoImpl(ApiServices(Dio())),
              ),
            ),
          ],
          child: Wasally(
            isLogin: isLogin,
          ),
        ),
      ),
    ),
  );
}
