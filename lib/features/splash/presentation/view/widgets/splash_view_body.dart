import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wasally/core/dependncy_injection/service_locator.dart';
import 'package:wasally/features/on_boarding/presentation/view/onboarding_view.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
    this.isLogin,
  });

  final bool? isLogin;

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Future<void> checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      try {
        final response = await getIt.get<Dio>().get('https://www.google.com');

        if (response.statusCode == 200) {
          navigateToNextScreen();
        } else {
          showCustomDialog();
        }

        // Internet is working if the response status code is 200
      } catch (e) {
        showCustomDialog();
      }
    } else {
      // No internet connection, show an error message or handle it as desired
      // ignore: use_build_context_synchronously
      showCustomDialog();
    }
  }

  Future<dynamic> showCustomDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('No Internet Connection'),
        content:
            const Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => exit(0),
          ),
        ],
      ),
    );
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      if (widget.isLogin != null && widget.isLogin == true) {
        Get.off(() => BottomNavigationBarHome(),
            transition: Transition.rightToLeft);
      } else {
        Get.off(() => const OnboardingScreen(),
            transition: Transition.rightToLeft);
      }
    });
  }

  @override
  void initState() {
    checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFF),
      body: SizedBox(
        child: Center(
          child: Image.asset('assets/images/new_splash.gif'),
        ),
      ),
    );
  }
}
