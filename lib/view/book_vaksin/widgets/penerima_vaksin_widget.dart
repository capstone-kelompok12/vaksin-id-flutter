import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/widgets/add_member_widget.dart';

class PenerimaVaksinWidget extends StatefulWidget {
  const PenerimaVaksinWidget({super.key});

  @override
  State<PenerimaVaksinWidget> createState() => _PenerimaVaksinWidgetState();
}

class _PenerimaVaksinWidgetState extends State<PenerimaVaksinWidget> {
  int penerima = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Penerima Vaksin',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  '32303012503770011',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'JohnDoe',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Ada penerima vaksin lainnya?',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Tambahan dalam 1 antrian',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  context: context,
                  builder: (context) => const AddMemberWidget(),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xFF717971),
                ),
              ),
              child: const Text(
                'Tambah',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF006D39),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
