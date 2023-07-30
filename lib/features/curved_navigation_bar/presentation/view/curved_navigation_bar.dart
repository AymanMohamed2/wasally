import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/old_orders_view.dart';
import 'package:wasally/features/home/presentation/view/home_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/person_info_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/current_orders_view.dart';

import '../../../../core/utils/api_services.dart';
import '../../../home/data/repositories/home_repo_impl.dart';
import '../../../home/presentation/manager/slider_cubit/slider_cubit.dart';

// ignore: must_be_immutable
class BottomNavigationBarHome extends StatefulWidget {
  BottomNavigationBarHome({Key? key, this.selectedindex = 0}) : super(key: key);
  int selectedindex;

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  Future<String> nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('userId')!;
  }

  @override
  void initState() {
    // nameRetriever().then((value) {
    //   BlocProvider.of<VerifyCubit>(context).getUserInfo(userId: value);
    // });
    super.initState();
  }

  List<Widget> pages = [
    const HomeView(),
    const CurrentOrdersView(),
    const OldOrdersView(),
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
                color: kPrimaryColor,
              ),
              Icon(
                Icons.beenhere,
                size: 30,
                color: kPrimaryColor,
              ),
              Icon(
                Icons.shopping_cart,
                size: 30,
                color: kPrimaryColor,
              ),
              Icon(
                Icons.person,
                size: 30,
                color: kPrimaryColor,
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
