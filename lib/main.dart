import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/detail_faskes/detail_faskes_screen.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/detail_faskes_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DetailFasKesViewModel>(
            create: (_) => DetailFasKesViewModel()),
        ChangeNotifierProvider<BookVaksinViewModel>(
            create: (_) => BookVaksinViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF006D39),
            ),
        useMaterial3: true,
      ),
      home: const DetailFasKesScreen(),
    );
  }
}
