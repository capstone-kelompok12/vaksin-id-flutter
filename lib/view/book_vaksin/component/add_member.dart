import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/add_member_no_result.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/add_member_nothing.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/add_member_with_result.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin/book_vaksin_view_model.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nikController = TextEditingController();
  // late ValueNotifier<bool> nikResult;
  // late ValueNotifier<bool> searching;

  @override
  void initState() {
    // searching = ValueNotifier(false);
    // nikResult = ValueNotifier(false);

    super.initState();
    Provider.of<BookVaksinViewModel>(context, listen: false)
        .searchCondition(false, false);
  }

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
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 4,
                      width: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFF717971).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
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
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => value == ''
                                  ? 'NIK tidak boleh kosong.'
                                  : value!.length != 16
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
                          Consumer<BookVaksinViewModel>(
                            builder: (context, search, child) => OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xFF717971),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try {
                                    await search.checkNIK(nikController.text);
                                    search.searchCondition(true, true);
                                  } catch (e) {
                                    search.searchCondition(true, false);
                                  }
                                }
                              },
                              child: const Text(
                                'Cari',
                                style: TextStyle(
                                  fontSize: 14,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 4,
              color: const Color(0xFFE1E3DE),
            ),

            // detail penerima vaksin
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                color: const Color(0xFFFAFAFB),
                height: 400,
                width: double.infinity,
                child: Consumer<BookVaksinViewModel>(
                  builder: (context, result, child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),

                    // kondisi kalau nik ditemukan atau tidak
                    child: result.search == true
                        ? result.found == true
                            ? const AddMemberWithResult()
                            : const AddMemberNoResult()
                        : const AddMemberNothing(),
                    // nik ketemu? AddMemberWithResult()
                    //: nik tidak ketemu? AddMemberNoResult()
                    //: AddMemberNothing();
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
