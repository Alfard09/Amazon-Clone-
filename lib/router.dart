import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/features/auth/screens/auth_screen.dart';
import 'package:amazonclone/features/home/screens/home_screens.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          settings:
          routeSettings;
          return AuthScreen();
        },
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          settings:
          routeSettings;
          return HomeScreen();
        },
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) {
          settings:
          routeSettings;
          return BottomBar();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (_) {
          settings:
          routeSettings;
          return Scaffold(
            body: Text('Screen Does not Exist!!'),
          );
        },
      );
  }
}
