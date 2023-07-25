import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/app.dart';
import 'core/utils/language_manager.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('d3c7d9c5-9e70-48f0-891e-9d13208e8cba');
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    // ignore: avoid_print
    print('Accepted Permession $accepted');
  });
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
          child: Wasally(
            isLogin: isLogin,
          ),
        ),
      ),
    ),
  );
}
