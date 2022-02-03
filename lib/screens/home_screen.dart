import 'package:all_possible_launchers_example/launcher_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final res =
                    await LauncherService.handleCallLauncher("+9779847900000");
                if (kDebugMode) print(res);
              },
              child: const Text("Phone Call"),
            ),
            ElevatedButton(
              onPressed: () async {
                final res =
                await LauncherService.handleSmsLauncher("+9779847900000");
                if (kDebugMode) print(res);
              },
              child: const Text("Sms"),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await LauncherService.handleWhatsAppLauncher(
                    "+9779847900000");
                if (kDebugMode) print(res);
              },
              child: const Text("WhatsApp"),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await LauncherService.handleEmailLauncher(
                    "info@amcbizprojects.co.in",
                    subject: "Testing",
                    message: "This is testing message");
                if (kDebugMode) print(res);
              },
              child: const Text("Email"),
            ),
          ],
        ),
      ),
    );
  }
}
