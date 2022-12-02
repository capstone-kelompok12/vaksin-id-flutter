import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Bottom Navigation Bar'),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 20.83,
          ),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        width: 360,
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFE7F1E8),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
          ],
        ),
      ),
    );
  }
}
