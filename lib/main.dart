import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/auth/register_screen.dart';
import 'package:vaksin_id_flutter/view_model/auth/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
      ],
      child: const MaterialApp(
        home: RegisterScreen(),
      ),
    );
  }
}
