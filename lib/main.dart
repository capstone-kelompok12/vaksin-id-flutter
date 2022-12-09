import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/profile/edit_profile_screen.dart';
import 'package:vaksin_id_flutter/view/profile/profile_screen.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp();
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: MaterialApp(
        title: 'Profil',
        theme: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF006D39),
              ),
          useMaterial3: true,
        ),
        home: const ProfileScreen(),
      ),
    );
  }
}
