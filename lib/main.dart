import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planets_app/Planets_Screen/View/home_screen.dart';
import 'package:planets_app/Planets_Screen/View/splace_screen.dart';
import 'package:planets_app/Planets_Screen/View/view_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => SplaceScreen(),
          'home':(p0) => HomeScreen(),
          'view':(p0) => ViewScreen(),
        },
      ),
    ),
  );
}
