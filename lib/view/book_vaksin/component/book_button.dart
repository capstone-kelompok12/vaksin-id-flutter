import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/book_success.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/double_check_book.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin_view_model.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<BookVaksinViewModel>(
            builder: (context, booking, child) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D39),
              ),
              child: const Text(
                'Book Vaksin',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(28))),
                    context: context,
                    builder: (context) {
                      return booking.doubleCheck == false
                          ? const DoubleCheckBook()
                          : const BookSuccess(); // nanti pake logic masukin data langsung
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
