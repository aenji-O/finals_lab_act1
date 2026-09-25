import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SpringCoffeeApp());
}

class SpringCoffeeApp extends StatelessWidget {
  const SpringCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring Coffee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        fontFamily: GoogleFonts.inriaSerif().fontFamily,
        textTheme: GoogleFonts.inriaSerifTextTheme(),
        primaryTextTheme: GoogleFonts.inriaSerifTextTheme(),
      ),
      // Named routes: the initial route is the Login screen.
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
