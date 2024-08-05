import 'package:flutter/material.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/screens/dashboard_screen.dart';
import 'package:frontend/screens/forgot_password_screen.dart';
import 'package:frontend/screens/reset_password_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Django App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
      },
    );
  }
}
