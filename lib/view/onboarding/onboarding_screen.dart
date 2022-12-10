// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/home/list_vaccine_screen.dart';
import 'package:vaksin_id_flutter/view/home/nearby_hf_screen.dart';

import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Lawan Pandemi\ndengan Vaksin!',
    'Pesan Tiket\ndengan Mudah',
    'Lakukan Vaksinasi\ndengan Aman',
  ];

  List<String> subtitles = [
    'Kami siap membantu Anda melindungi diri serta keluarga dari ancaman virus.',
    'Nikmati kemudahan book vaksinasi dengan hanya satu antrean untuk seluruh anggota keluarga. ',
    'VAKSIN.ID telah bekerja sama dengan fasilitas kesehatan terpercaya yang tersebar se-Indonesia!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/onboard_1.png',
                ),
                Image.asset(
                  'assets/onboard_2.png',
                ),
                Image.asset(
                  'assets/onboard_3.png',
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 80.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  // carouselController.nextPage();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56),
                                  ),
                                ),
                                child: Text(
                                  'Mulai',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 0
                                    ? primaryColor
                                    : greyColor,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 1
                                    ? primaryColor
                                    : greyColor,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 2
                                    ? primaryColor
                                    : greyColor,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56),
                                  ),
                                ),
                                child: Text(
                                  'Selanjutnya',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
