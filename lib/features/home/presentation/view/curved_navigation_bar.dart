import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/home/presentation/view/home_view.dart';
import 'package:wasally/features/home/presentation/view/person_info_view.dart';
import 'package:wasally/features/home/presentation/view/talbat_view.dart';

import '../../../../core/utils/api_services.dart';
import '../manager/categories_cubit/home_cubit.dart';
import '../manager/category_details_cubit/category_details_cubit.dart';
import '../manager/slider_cubit/slider_cubit.dart';

class BottomNavigationBarHome extends StatefulWidget {
  const BottomNavigationBarHome({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  int selectedindex = 0;
  List<Widget> pages = [
    const HomeView(),
    const Talbat(),
    const Person(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            ApiServices(),
          ),
        ),
        BlocProvider(
          create: (context) => SliderCubit(
            ApiServices(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryDetailsCubit(
            ApiServices(),
          ),
        ),
      ],
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: selectedindex,
            animationDuration: const Duration(milliseconds: 400),
            height: 50,
            color: Colors.white,
            backgroundColor: Colors.orangeAccent,
            buttonBackgroundColor: Colors.black,
            items: const [
              Icon(
                Icons.home,
                size: 30,
                color: Colors.orange,
              ),
              Icon(
                Icons.beenhere,
                size: 30,
                color: Colors.orange,
              ),
              Icon(
                Icons.person,
                size: 30,
                color: Colors.orange,
              ),
            ],
            onTap: (index) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              BlocProvider.of<LoginCubit>(context).email =
                  prefs.getString('email');
              prefs.getString('email');
              setState(() {
                selectedindex = index;
              });
            },
          ),
          body: pages.elementAt(selectedindex)),
    );
  }
}
