import 'package:flutter/material.dart';
import 'package:space_app/UI/home_screen/home_screen.dart';
import 'package:space_app/UI/login_screen/login_screen.dart';
import 'package:space_app/core/constants/app_routes.dart';
import 'package:space_app/core/theme/app_theme.dart';

import 'UI/details_screen/details_screen.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRoute,
      routes: {
        AppRoutes.loginRoute: (context)=> LoginScreen(),
        AppRoutes.homeRoute: (context)=> HomeScreen(),
        AppRoutes.detailsRoute: (context)=> DetailsScreen(),
      },
    );
  }
}
