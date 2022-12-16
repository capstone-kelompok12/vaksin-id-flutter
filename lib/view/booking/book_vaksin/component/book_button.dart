import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/component/book_success.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/component/double_check_book.dart';
import 'package:vaksin_id_flutter/view_model/booking/book_vaksin_view_model.dart';

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
            builder: (context, booking, child) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Kapasitas 49/90',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF006D39)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                      if (booking.doubleCheck == false) {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(28),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return const DoubleCheckBook();
                          },
                        );
                      }
                      if (booking.doubleCheck == true) {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(28),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return booking.doubleCheck == false
                                ? const DoubleCheckBook()
                                : const BookSuccess(); // nanti pake logic masukin data langsung
                          },
                        );
                      }
                    },
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
