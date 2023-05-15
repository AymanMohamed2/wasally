import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, this.userId, this.phoneNumber});
  final String? userId;
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(
        phoneNumber: phoneNumber,
        userId: userId,
      ),
    );
  }
}
