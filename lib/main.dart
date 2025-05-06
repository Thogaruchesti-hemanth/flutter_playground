import 'package:flutter/material.dart';
import 'package:profile_page/CalculatorApp/calculator_app.dart';
import 'package:profile_page/JuiceApp/home_page.dart';
import 'package:profile_page/ProfileScreenApp/profile_screen.dart';
import 'package:profile_page/SnapService/snap_service_home.dart';

import 'EducationApp/first_page.dart';
import 'SnapService/snapserve.dart';
import 'TapSelectionApp/TapSelectionScreen.dart';
import 'TodoListApp/todo_list.dart';
import 'TodoListApp/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: SnapServiceHome(),
    );
  }
}
