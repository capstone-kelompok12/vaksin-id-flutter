import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import 'package:vaksin_id_flutter/view/booking/detail_faskes/component/form_book.dart';
import 'package:vaksin_id_flutter/view/booking/detail_faskes/component/lanjutkan_book_button.dart';
import 'package:vaksin_id_flutter/view_model/booking/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

class DetailFasKesScreen extends StatefulWidget {
  const DetailFasKesScreen({super.key});

  @override
  State<DetailFasKesScreen> createState() => _DetailFasKesScreenState();
}

class _DetailFasKesScreenState extends State<DetailFasKesScreen> {
  @override
  void initState() {
    super.initState();
    final book = Provider.of<BookVaksinViewModel>(context, listen: false);
    book.penerimaVaksin = [];
    book.bookingList = [];
    // final detail = Provider.of<DetailFasKesViewModel>(context, listen: false);
    // Provider.of<DetailFasKesViewModel>(context, listen: false).getClear();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   final detail = Provider.of<DetailFasKesViewModel>(context, listen: false);
  //   detail.selectJenisVaksin('');
  //   detail.selectDosisVaksin('');
  //   detail.selectTanggalVaksin('');
  //   detail.selectWaktuVaksin('');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Vaksin'),
      ),
      body: Consumer<DetailFasKesViewModel>(
        builder: (context, detail, _) => detail.myState == MyState.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : detail.myState == MyState.none
                ? Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 9),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          alignment: const Alignment(0, -1),
                                          image: NetworkImage(
                                            detail.detailHf!.image!,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: Text(
                                    detail.detailHf!.name!,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          detail.detailHf!.address!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: const Color(0xFFD2E4FF),
                                        shape: const CircleBorder(),
                                        minWidth: 0,
                                        height: 40,
                                        onPressed: () {},
                                        child: const Icon(
                                          Icons.near_me_outlined,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    detail.detailHf!.distance!,
                                    style: const TextStyle(
                                      color: Color(0xFF006D39),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16)
                              ],
                            ),
                          ),
                          Container(
                            height: 4,
                            color: const Color(0xFFE1E3DE),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: FormBook(),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: Text('Error Load Data'),
                  ),
      ),
      bottomSheet: const LanjutkanBookButton(),
    );
  }
}
