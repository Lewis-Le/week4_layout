import 'package:flutter/material.dart';
import './login_screen.dart';
import '../ui/home_screen.dart';
import '../ui//details_screen.dart';


class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/details': (context) => DetailsScreen(),
      },
      initialRoute: '/home',
    );
  }

}