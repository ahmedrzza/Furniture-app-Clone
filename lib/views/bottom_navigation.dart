import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jpb_project/utils/colors.dart';
import 'package:jpb_project/views/home_screen.dart';
import 'package:jpb_project/views/product_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    final screens = [const HomeScreen(), const ProductScreen(),
      const HomeScreen()];
    final CurvedNavigationBarState? navBarState =
        _bottomNavigationKey.currentState;
    navBarState?.setPage(1);
    int myIndex = 0;

    ontap(int index) {
      navBarState;
      setState(() {
        myIndex = index;
      });
    }

    return Scaffold(
      body: getSelectedWidget(index: myIndex),
      bottomNavigationBar: CurvedNavigationBar(
          // key: _bottomNavigationKey,
          backgroundColor: UiColors.customColor,
          color: Colors.black26,
          height: 50,
          animationDuration: const Duration(milliseconds: 300),
          onTap: ontap,
          index: myIndex,
          letIndexChange: (myIndex) => true,
          items: const [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ]),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const HomeScreen();
      break;
    case 1:
      widget = const ProductScreen();
      break;
    default:
      widget = const HomeScreen();
      break;
  }
  return widget;
}
