import 'package:amazonclone/constants/global_variable.dart';
import 'package:amazonclone/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidt = 25;

  List<Widget> pages = [
    PostsScreen(),
    const Center(
      child: Text('Analytics Page'),
    ),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: GolbalVariables.appBarGradient,
              ),
            ),
            title: Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            )),
      ),
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
          //analytics
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
                Icons.analytics_outlined,
              ),
            ),
            label: "",
          ),
          //Orders
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
              child: const Icon(
                Icons.all_inbox_outlined,
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
