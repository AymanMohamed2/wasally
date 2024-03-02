import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/features/home/presentation/view/home_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/person_info_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/current_orders_view.dart';



// ignore: must_be_immutable
class BottomNavigationBarHome extends StatefulWidget {
  BottomNavigationBarHome({Key? key, this.selectedindex = 0}) : super(key: key);
  int selectedindex;

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  List<Widget> pages = [
    const HomeView(),
    const CurrentOrdersView(),
    // const OldOrdersView(),
    const Person(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: widget.selectedindex,
          animationDuration: const Duration(milliseconds: 400),
          height: 50,
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
        body: pages.elementAt(widget.selectedindex));
  }
}
