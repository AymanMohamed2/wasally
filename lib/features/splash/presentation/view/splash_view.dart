import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, this.isLogin});

  final bool? isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(
        isLogin: isLogin,
      ),
    );
  }
}
