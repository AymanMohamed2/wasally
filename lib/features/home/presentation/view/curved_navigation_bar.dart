import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wasally/features/home/presentation/view/home_view.dart';
import 'package:wasally/features/home/presentation/view/person_info_view.dart';
import 'package:wasally/features/home/presentation/view/talbat_view.dart';

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
    return Scaffold(
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
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
        ),
        body: pages.elementAt(selectedindex));
  }
}
