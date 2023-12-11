import 'package:amazonclone/features/auth/screens/auth_screen.dart';
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
