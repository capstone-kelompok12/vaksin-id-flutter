import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import 'package:vaksin_id_flutter/view/home/widgets/news_card.dart';

import '../../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) => SizedBox(
            // 1125 all component
            // value.locationListWithDistance.isNotEmpty ? 1045 : 865
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // value.haspermission ? 280 : 196
                  height: 280,
                  padding: const EdgeInsets.only(
                      top: 41, bottom: 16, left: 16, right: 16),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 109, 57, 0.12)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                            width: double.infinity,
                            height: 28,
                            child: Text(
                              'Halo, User',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            )),
                      ),
                      Padding(
                        // value.haspermission ? 24 : 0
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          width: double.infinity,
                          height: 87,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Vaksin dulu yuk!',
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Kapan lagi book vaksinasi tanpa ribet.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 101,
                                  height: double.infinity,
                                  child: Image.asset('assets/amico.png'))
                            ],
                          ),
                        ),
                      ),
                      // value.haspermission ?
                      Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: whiteColor),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Set Lokasi dulu, ya'),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                  ),
                                  onPressed: () async {
                                    // value.getHealthFacilities();
                                    // value.activateGps();

                                    // if (value.haspermission) {
                                    //   value.getCurrentLocation();
                                    //   print('GPS enabled');
                                    // }
                                  },
                                  child: Text(
                                    'Izinkan',
                                    style: TextStyle(color: whiteColor),
                                  )),
                            ]),
                      )
                      // : Container()
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 28, bottom: 16, left: 16, right: 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Daftar Vaksin di Indonesia',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                              Transform.rotate(
                                  angle: 110,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child:
                                        Icon(Icons.arrow_back_ios_new_rounded),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 176,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 8,
                            ),
                            itemCount: 5,
                            itemBuilder: (context, index) => SizedBox(
                              width: 115,
                              height: 176,
                              child: Card(
                                color: whiteColor,
                                child: InkWell(
                                  onTap: () => print('gridTap'),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: double.infinity,
                                          height: 115,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 35, vertical: 20),
                                            child: Image.asset(
                                                'assets/vaksin.png'),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 5, left: 8, right: 8),
                                        child: Text(
                                          'TestVaksin',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const Text('Dosis')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<HomeViewModel>(
                    builder: (context, value, _) =>
                        // value.locationListWithDistance.isNotEmpty ?
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 264,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 28, bottom: 16, left: 16, right: 16),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fasilitas Kesehatan Terdekat',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      Transform.rotate(
                                          angle: 110,
                                          child: const Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Icon(Icons
                                                .arrow_back_ios_new_rounded),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 180,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 8,
                                    ),
                                    itemCount: 5,
                                    itemBuilder: (context, index) => SizedBox(
                                      width: 215,
                                      height: 180,
                                      child: Card(
                                        color: whiteColor,
                                        child: InkWell(
                                          onTap: () => print('gridTap'),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                height: 115,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  child: Image.network(
                                                      faker.image.image(
                                                          keywords: [
                                                            'hospital'
                                                          ],
                                                          random: true),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 4,
                                                    bottom: 5,
                                                    left: 8,
                                                    right: 8),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Nama Fasilitas Kesehatan',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 16,
                                                    left: 8,
                                                    right: 8),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text('Jarak')),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    // : Container()
                    ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Berita seputar kesehatan',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      Consumer<HomeViewModel>(
                        builder: (context, provider, child) {
                          final data = provider.news;
                          if (provider.myState == MyState.loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            );
                          } else if (provider.myState == MyState.none) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return NewsCard(news: data[index]);
                              },
                            );
                          } else {
                            return const Text('Data error mas cek internetmu');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
          
            ),
          ),
        ),
      ),
    );
  }
}