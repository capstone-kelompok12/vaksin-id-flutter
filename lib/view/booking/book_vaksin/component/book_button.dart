import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/component/book_success.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/component/double_check_book.dart';
import 'package:vaksin_id_flutter/view_model/booking/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Consumer<DetailFasKesViewModel>(
                    builder: (context, detail, child) {
                  return detail.selectSession!.capacity != null
                      ? Text(
                          'Kapasitas ${detail.selectSession!.capacity}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF006D39)),
                        )
                      : const SizedBox();
                }),
              ),
              Consumer<BookVaksinViewModel>(
                builder: (context, booking, child) => SizedBox(
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
                    onPressed: () async {
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
                        try {
                          await booking.createBooking(booking.bookingList);
                        } catch (e) {
                          print(e);
                        }

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
                                : const BookSuccess();
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
