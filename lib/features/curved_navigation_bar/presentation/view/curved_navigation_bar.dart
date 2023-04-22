import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/person_cubit/person_cubit.dart';
import 'package:wasally/features/home/presentation/view/home_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/person_info_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/talbat_view.dart';

import '../../../../core/utils/api_services.dart';
import '../../../home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import '../../../home/presentation/manager/slider_cubit/slider_cubit.dart';

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
          create: (context) => SliderCubit(
            ApiServices(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryDetailsCubit(
            ApiServices(),
          ),
        ),
        BlocProvider(
          create: (context) => PersonCubit(
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
              setState(() {
                selectedindex = index;
              });
              if (index == 2) {
                await BlocProvider.of<PersonCubit>(context).getUserInfo();
              }
            },
          ),
          body: pages.elementAt(selectedindex)),
    );
  }
}
