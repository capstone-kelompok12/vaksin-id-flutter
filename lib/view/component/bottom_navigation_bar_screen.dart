import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view_model/bottom_navigation/bottomnav_view_model.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key, required this.setIndex})
      : super(key: key);

  final int setIndex;

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (widget.setIndex) {
        case 1:
          Provider.of<BottomnavViewModel>(context, listen: false).setIndex(1);
          break;
        case 2:
          Provider.of<BottomnavViewModel>(context, listen: false).setIndex(2);
          break;
        case 3:
          Provider.of<BottomnavViewModel>(context, listen: false).setIndex(3);
          break;
        default:
          Provider.of<BottomnavViewModel>(context, listen: false).setIndex(0);
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomnavViewModel>(
        builder: (context, value, child) {
          return value.listScreen[value.index];
        },
      ),
      bottomNavigationBar: Consumer<BottomnavViewModel>(
        builder: (context, provider, child) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xffEAFFEA),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.vaccines_outlined),
                  label: 'Book',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_num_outlined),
                  label: 'Tiket',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: primaryColor,
              unselectedItemColor: blackColor,
              currentIndex: provider.index,
              onTap: (value) {
                provider.setIndex(value);
              },
            ),
          );
        },
      ),
    );
  }
}
