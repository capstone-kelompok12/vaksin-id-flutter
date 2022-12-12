import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/detail_faskes/detail_faskes_screen.dart';
import 'package:vaksin_id_flutter/view/home/home_screen.dart';
import 'package:vaksin_id_flutter/view/home/nearby_hf_screen.dart';
import 'package:vaksin_id_flutter/view/onboarding/onboarding_screen.dart';
import 'package:vaksin_id_flutter/view_model/auth/auth_view_model.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin/detail_faskes_view_model.dart';
import 'package:vaksin_id_flutter/view/splash/splash_screen.dart';

import 'package:vaksin_id_flutter/view/profile/edit_profile_screen.dart';
import 'package:vaksin_id_flutter/view/profile/profile_screen.dart';
import 'package:vaksin_id_flutter/view_model/bottom_navigation/bottomnav_view_model.dart';
import 'package:vaksin_id_flutter/view_model/home_view_model.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => BookVaksinViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomnavViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VAKSIN.ID',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
            ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
