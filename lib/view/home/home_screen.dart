import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';

import '../../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).checkGps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarScreen(),
      body: SingleChildScrollView(
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) =>
            SizedBox(
              // 1125 all component
              // value.locationListWithDistance.isNotEmpty ? 1045 : 865
              height: value.sizeHomeScreen,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // value.haspermission ? 280 : 196
                    height: value.sizeHeading,
                    padding: const EdgeInsets.only(
                      top: 41, bottom: 16, left: 16, right: 16),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 109, 57, 0.12)),
                    child: value.apiState == ApiState.loading ?
                      const Center(child: CircularProgressIndicator(),) :
                      value.apiState == ApiState.none ?
                     Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: SizedBox(
                            width: double.infinity,
                            height: 28,
                            child: Text(
                              'Halo, ${value.listHealthFaci?.data!.user!.fullname}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22
                              ),)),
                        ),
                        Padding(
                          // value.haspermission ? 24 : 0
                          padding: EdgeInsets.only(bottom: value.paddingBottomHeading),
                          child: SizedBox(
                            width: double.infinity,
                            height: 87,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Vaksin dulu yuk!',
                                          style: TextStyle(fontSize: 16)),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Kapan lagi book vaksinasi tanpa ribet.',
                                          style: TextStyle(fontSize: 16),),
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
                        !value.haspermission ?
                        Container(
                          width: double.infinity,
                          height: 60,
                          padding: const EdgeInsets.only(left: 16, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: whiteColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Set Lokasi dulu, ya'),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: whiteColor, 
                                ),
                                onPressed: () async {
                                  // value.getNearbyHF();
                                  await value.activateGps();
                                  
                                  if (value.haspermission) {
                                    await value.getCurrentLocation();
                                    print('GPS enabled');
                                  }
                                }, 
                                child: Text(
                                  'Izinkan',
                                  style: TextStyle(color: whiteColor),)),
                          ]),
                        ) 
                        : Container()
                      ],
                    ) : const Center(child: Text('Error Load Data'),)
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 28, bottom: 16,
                            left: 16, right: 16),
                          child: SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Daftar Vaksin di Indonesia',
                                  style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                                Transform.rotate(
                                  angle: 110,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Icon(Icons.arrow_back_ios_new_rounded),
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
                            child: value.apiState == ApiState.loading ?
                              const Center(child: CircularProgressIndicator(),) :
                            value.apiState == ApiState.none ? 
                              ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) => const SizedBox(width: 8,), 
                                itemCount: value.listVaccine!.data!.length,
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
                                              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                                              child: Image.asset('assets/vaksin.png'),
                                            )),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 5, left: 8, right: 8),
                                            child: Text(
                                              value.listVaccine!.data![index].name ?? '',
                                              style: const TextStyle(fontWeight: FontWeight.w600),),
                                          ),
                                          Text('${value.listVaccine!.data![index].stock}')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),) 
                            : const Center(child: Text('Error Load Data'),)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<HomeViewModel>(
                    builder: (context, value, _) =>
                    value.locationListWithDistance.isNotEmpty ?
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fasilitas Kesehatan Terdekat',
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w700)),
                                    Transform.rotate(
                                        angle: 110,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(Icons.arrow_back_ios_new_rounded),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 180,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => const SizedBox(
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
                                                  borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                                  child: Image.network(faker.image.image(
                                                    keywords: ['hospital'],
                                                    random: true),
                                                    fit: BoxFit.fill),
                                                ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, bottom: 5, left: 8, right: 8),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Nama Fasilitas Kesehatan',
                                                  style: TextStyle(fontWeight: FontWeight.w600),)),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 16, left: 8, right: 8),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Jarak')),
                                            )],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )],
                        ),
                      )
                    : Container()
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 8, top: 28, left: 16, right: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text('Berita seputar kesehatan',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                              bottom: 16, top: 8, left: 16, right: 16),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 16,),
                            itemCount: 5,
                            itemBuilder: (context, index) => Card(
                              color: whiteColor,
                              child: InkWell(
                                onTap: () => print('listTap'),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, left: 8, top: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(faker.image.image(
                                            width: 92,
                                            height: 92,
                                            keywords: ['news'],
                                            random: true)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 95,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Judul Berita',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 14),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4),
                                                  child: Text(
                                                    'Publisher, Tanggal Publsih',
                                                    maxLines: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                ],
              ),
            )
        ),
      ),
    );
  }
}