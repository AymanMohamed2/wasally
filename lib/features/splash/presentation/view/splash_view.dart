import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, this.userId});
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(
        userId: userId,
      ),
    );
  }
}
