import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/widgets/double_check_book_widget.dart';

class ButtonBookWidget extends StatefulWidget {
  const ButtonBookWidget({super.key});

  @override
  State<ButtonBookWidget> createState() => _ButtonBookWidgetState();
}

class _ButtonBookWidgetState extends State<ButtonBookWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                context: context,
                builder: (context) => const DoubleCheckBookWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}
