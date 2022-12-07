import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/add_member_nothing.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
          color: Color(0xFFE1E3DE),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                color: Color(0xFFFAFAFB),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tambah Penerima Vaksin',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: nikController,
                            validator: (value) => value == ''
                                ? 'NIK tidak boleh kosong.'
                                : value!.length < 16
                                    ? 'NIK harus 16 digit.'
                                    : null,
                            decoration: InputDecoration(
                              label: const Text('Masukkan NIK'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.cancel_outlined),
                                onPressed: () {
                                  nikController.clear();
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF717971),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                          child: const Text(
                            'Cari',
                            style: TextStyle(
                              fontSize: 14,
                              // color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),

            // detail penerima vaksin
            Container(
              color: const Color(0xFFFAFAFB),
              height: 400,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),

                // kondisi kalau nik ditemukan atau tidak
                child: AddMemberNothing(),
                // nik ketemu? AddMemberWithResult()
                //: nik tidak ketemu? AddMemberNoResult()
                //: AddMemberNothing();
              ),
            )
          ],
        ),
      ),
    );
  }
}
