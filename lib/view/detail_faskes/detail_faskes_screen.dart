import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/detail_faskes/component/form_book.dart';
import 'package:vaksin_id_flutter/view/detail_faskes/component/lanjutkan_book_button.dart';
import 'package:vaksin_id_flutter/view_model/detail_faskes_view_model.dart';

class DetailFasKesScreen extends StatelessWidget {
  const DetailFasKesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Vaksin'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 9),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                child: Consumer<DetailFasKesViewModel>(
                  builder: (context, detail, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                alignment: Alignment(0, -1),
                                image: NetworkImage(
                                    'http://www.metropolitan.id/wp-content/uploads/2018/06/222-3.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          'RS. Bina Husada',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Text(
                                'Jalan Raya Mayor Oking Jaya Atmaja No.KM, RW No.101, Ciriung, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16917',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '900 m',
                          style: TextStyle(
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
      ),
      bottomSheet: const LanjutkanBookButton(),
    );
  }
}
