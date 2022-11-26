import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/profile/edit_profile_screen.dart';
import 'package:vaksin_id_flutter/view/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp();
    return MaterialApp(
      title: 'Profil',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Rubik',
      ),
      home: const EditProfileScreen(),
    );
  }
}
