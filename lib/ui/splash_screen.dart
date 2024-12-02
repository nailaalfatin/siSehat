import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // buat logo nya jadi fade in
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isVisible = true;
      });
    });

    // Navigate ke home screen setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/on-boarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0, // The opacity will change after 1 second
          duration: const Duration(seconds: 1),
          child: Image.asset(
            'assets/images/logo-Si-Sehat.png',
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}