import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin/book_vaksin_view_model.dart';

class AddMemberWithResult extends StatelessWidget {
  const AddMemberWithResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookVaksinViewModel>(
      builder: (context, tambah, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Apakah penerima vaksin benar?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'NIK',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              tambah.penerima.nik!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Nama',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              tambah.penerima.nama!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D39),
              ),
              onPressed: () {
                tambah.addPenerima(
                  tambah.penerima.nik!,
                  tambah.penerima.nama!,
                  '0732774c-96cc-414c-a399-562c55bd5084',
                );

                Navigator.pop(context);
              },
              child: const Text(
                'Ya, tambah ke antrian',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
