import 'package:flutter/material.dart';

class AddMemberWidget extends StatefulWidget {
  const AddMemberWidget({super.key});

  @override
  State<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nikController = TextEditingController();

  @override
  void dispose() {
    nikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: 480,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
          color: Color(0xFFFBFDF7),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                // iconnya drag handle nya ga nemu yg 1
                Icons.drag_handle_rounded,
                color: const Color(0xFF717971).withOpacity(0.4),
                size: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      controller: nikController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == ''
                          ? 'Tolong input NIK yang terdaftar di negara !'
                          : null,
                      decoration: InputDecoration(
                        label: const Text('Masukkan NIK'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006D39),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    child: const Text(
                      'Tambah',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
