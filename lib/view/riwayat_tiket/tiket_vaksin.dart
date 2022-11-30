import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TiketVaksinPage extends StatefulWidget {
  const TiketVaksinPage({super.key});

  @override
  State<TiketVaksinPage> createState() => _TiketVaksinPageState();
}

class _TiketVaksinPageState extends State<TiketVaksinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(child: Text('Tiket Vaksin')),
      ),
    );
  }
}
