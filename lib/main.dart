import 'package:all_possible_launchers_example/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LauncherApp());
}

class LauncherApp extends StatelessWidget {
  const LauncherApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Launcher Demo App",
      home: const HomeScreen(),
    );
  }
}