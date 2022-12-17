import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/home/home_screen.dart';
import 'package:vaksin_id_flutter/view/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> startTime() async {
    final prefs = SharedService();
    String? token = await prefs.getToken();

    await Future.delayed(
      const Duration(seconds: 4),
      () {
        if (token != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationBarScreen(setIndex: 0),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 3),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo_vaksin.png'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
