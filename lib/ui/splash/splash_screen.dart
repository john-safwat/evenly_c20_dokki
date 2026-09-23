import 'package:evently_c20_dokki/core/config/app_config.dart';
import 'package:evently_c20_dokki/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../setup/setup_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        user == null ? SetupScreen.routeName : HomeScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/app_logo_${provider.themeMode == ThemeMode.light ? "light" : "dark"}.png",
                  width: MediaQuery.sizeOf(context).width * .6,
                ),
              ),
            ),
            Image.asset(
              "assets/images/app_branding_${provider.themeMode == ThemeMode.light ? "light" : "dark"}.png",
              width: MediaQuery.sizeOf(context).width * .5,
            ),
          ],
        ),
      ),
    );
  }
}
