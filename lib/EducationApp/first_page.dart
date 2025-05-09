import 'package:flutter/material.dart';
import 'package:profile_page/EducationApp/screens/home_screen.dart';

class EducationApp extends StatelessWidget {
  const EducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Edu Tech",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff2d3142),
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff2d3142),
          ),
          bodyLarge: TextStyle(color: Color(0xff4f5d75)),
          bodyMedium: TextStyle(color: Color(0xff4f5d75)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff4361ee),
          primary: Color(0xff43461ee),
          secondary: Color(0xff3d8efc),
          tertiary: Color(0xffe63946),
          background: Colors.white,
          surface: Color(0xfff9f9f9),
        ),
      ),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
