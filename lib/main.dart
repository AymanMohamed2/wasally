import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/app.dart';
import 'package:wasally/core/utils/notification_services.dart';
import 'core/utils/language_manager.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  NotificationServices.initOneSignal();
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
          ],
          child: DevicePreview(
            builder: (context) => Wasally(
              isLogin: isLogin,
            ),
          ),
        ),
      ),
    ),
  );
}
