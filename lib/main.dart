import 'dart:js';

import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/global_variable.dart';
import 'package:amazonclone/features/auth/screens/auth_screen.dart';
import 'package:amazonclone/features/auth/services/auth_service.dart';
import 'package:amazonclone/features/home/screens/home_screens.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:amazonclone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context as BuildContext);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GolbalVariables.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: GolbalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        // useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
