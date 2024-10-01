import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/camera_scan_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CameraScanScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 350,
          width: 390,
          child: Image.asset(
            'assets/gifs/splash.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
