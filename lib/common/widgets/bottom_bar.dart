import 'package:amazonclone/constants/global_variable.dart';
import 'package:amazonclone/features/account/screens/account__screen.dart';
import 'package:amazonclone/features/home/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual_home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidt = 25;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GolbalVariables.selectedNavBarColor,
        unselectedItemColor: GolbalVariables.unselectedNavBarColor,
        backgroundColor: GolbalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GolbalVariables.selectedNavBarColor
                        : GolbalVariables.backgroundColor,
                    width: bottomBarBorderWidt,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: "",
          ),
          //account
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GolbalVariables.selectedNavBarColor
                        : GolbalVariables.backgroundColor,
                    width: bottomBarBorderWidt,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: "",
          ),
          //cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GolbalVariables.selectedNavBarColor
                        : GolbalVariables.backgroundColor,
                    width: bottomBarBorderWidt,
                  ),
                ),
              ),
              child: badges.Badge(
                badgeContent: Text("2"),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
