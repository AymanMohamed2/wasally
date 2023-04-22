import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/app.dart';
import 'features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString("email");
  String? password = prefs.getString("password");

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SplashCubit()),
    ],
    child: Wasally(
      email: email,
      password: password,
    ),
  ));
}
