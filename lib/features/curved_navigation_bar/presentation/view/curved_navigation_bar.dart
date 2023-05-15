import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/features/home/presentation/view/home_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/person_info_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/talbat_view.dart';

import '../../../../core/utils/api_services.dart';
import '../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../../home/data/repositories/home_repo_impl.dart';
import '../../../home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import '../../../home/presentation/manager/slider_cubit/slider_cubit.dart';
import '../../../splash/presentation/manager/splash_cubit/splash_cubit.dart';

class BottomNavigationBarHome extends StatefulWidget {
  BottomNavigationBarHome({Key? key, this.selectedindex = 0}) : super(key: key);
  int selectedindex;

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  @override
  void initState() {
    BlocProvider.of<VerifyCubit>(context)
        .getUserInfo(userId: BlocProvider.of<SplashCubit>(context).userId);
    super.initState();
  }

  List<Widget> pages = [
    const HomeView(),
    const TalbatView(),
    const Person(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SliderCubit(
            HomeRepoImpl(ApiServices(Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryDetailsCubit(
            HomeRepoImpl(ApiServices(Dio())),
          ),
        ),
      ],
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: widget.selectedindex,
            animationDuration: const Duration(milliseconds: 400),
            height: SizeConfig.defaultSize! * 5.5,
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
                widget.selectedindex = index;
              });
            },
          ),
          body: pages.elementAt(widget.selectedindex)),
    );
  }
}
