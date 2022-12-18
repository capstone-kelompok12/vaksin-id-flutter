import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view_model/auth/auth_view_model.dart';
import 'package:vaksin_id_flutter/view/splash/splash_screen.dart';
import 'package:vaksin_id_flutter/view_model/booking/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

import 'package:vaksin_id_flutter/view_model/bottom_navigation/bottomnav_view_model.dart';
import 'package:vaksin_id_flutter/view_model/home/home_view_model.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting().then(
    (_) => runApp(
      MultiProvider(
        providers: [
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
            create: (context) => BookVaksinViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => TiketVaksinViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => DetailFasKesViewModel(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VAKSIN.ID',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
            ),
        cardColor: whiteColor,
        cardTheme: CardTheme(color: whiteColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
