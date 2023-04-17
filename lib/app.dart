import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/splash/presentation/view/splash_view.dart';

class Wasally extends StatelessWidget {
  const Wasally({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: GetMaterialApp(
        title: AppStrings.appName,
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
