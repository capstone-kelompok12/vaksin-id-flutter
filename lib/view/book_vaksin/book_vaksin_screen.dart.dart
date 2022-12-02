import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/widgets/button_book_widget.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/widgets/penerima_vaksin_widget.dart';

class BookVaksinScreen extends StatefulWidget {
  const BookVaksinScreen({super.key});

  @override
  State<BookVaksinScreen> createState() => _BookVaksinScreenState();
}

class _BookVaksinScreenState extends State<BookVaksinScreen> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Rumah Sakit',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              'RS. Pondok Indah',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Vaksin',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              'Ptfizer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Tanggal',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              '01 Januari 2022',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Sesi Waktu',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              '08.00 - 10.00',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Divider(
            color: Colors.black12,
            thickness: 2,
          ),
          PenerimaVaksinWidget(),
        ],
      ),
      bottomSheet: const ButtonBookWidget(),
    );
  }
}
