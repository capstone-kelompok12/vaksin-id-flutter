import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/book_vaksin_screen.dart.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookVaksinViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   // primarySwatch: Colors.blue,
        //   useMaterial3: true,
        //   fontFamily: 'Rubik',
        // ),
        theme: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
              ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
