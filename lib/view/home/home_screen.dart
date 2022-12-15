import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/services/home/home_service.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/auth/login_screen.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/home/component/list_health_news.dart';
import 'package:vaksin_id_flutter/view/home/component/list_nearby_hf.dart';
import 'package:vaksin_id_flutter/view/home/component/vaccine_list.dart';
import 'package:vaksin_id_flutter/view/onboarding/onboarding_screen.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';

import '../../view_model/home_view_model.dart';
import 'component/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final message = HealthFaciApi().messageAPI;

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).checkGps();
    Provider.of<ProfileViewModel>(context, listen: false).getUsersProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      // bottomNavigationBar: const BottomNavigationBarScreen(),
      body: SingleChildScrollView(
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) =>
            SizedBox(
              // 1125 all component
              // value.locationListWithDistance.isNotEmpty ? 1045 : 865
              height: value.sizeHomeScreen,
              child: Column(
                children: const [
                  HeaderHomeScreen(),
                  VaccineListHomeScreen(),
                  ListNearbyHfHomeScreen(),
                  Expanded(child: ListHealthNewsHomeScreen())
                ],
              ),
            )
        ),
      ),
    );
  }
}