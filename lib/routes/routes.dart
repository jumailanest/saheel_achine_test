import 'package:flutter/material.dart';
import 'package:saheel_machine_test/view/home_screen.dart';

class RouteClass {
  static const String homeScreen = "/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic>? _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text("404 - Page Not Found"),
        ),
      ),
    );
  }
}
