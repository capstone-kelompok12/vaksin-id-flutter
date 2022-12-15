import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin/detail_faskes_view_model.dart';

class FormBook extends StatelessWidget {
  const FormBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            'Pilih Opsi Book Vaksinasi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Consumer<DetailFasKesViewModel>(
          builder: (context, detail, child) => Column(
            children: [
              // Jenis Vaksin
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    label: const Text('Jenis Vaksin'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  value: detail.selectVaksin,
                  hint: detail.selectVaksin == null
                      ? const Text('Pilih Vaksin')
                      : Text('${detail.selectVaksin}'),
                  onChanged: (value) {
                    detail.selectJenisVaksin(value);
                  },
                  items: detail.vaksin
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),

              // Dosis
              detail.selectVaksin != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          label: const Text('Dosis'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        value: detail.selectDosis,
                        hint: detail.selectDosis == null
                            ? const Text('Pilih Dosis')
                            : Text('${detail.selectDosis}'),
                        onChanged: (value) {
                          detail.selectDosisVaksin(value);
                        },
                        items: detail.vaksin
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : const SizedBox(),

              // Tanggal
              detail.selectDosis != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          label: const Text('Tanggal'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        value: detail.selectTanggal,
                        hint: detail.selectTanggal == null
                            ? const Text('Pilih Tanggal')
                            : Text('${detail.selectTanggal}'),
                        onChanged: (value) {
                          detail.selectTanggalVaksin(value);
                        },
                        items: detail.vaksin
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : const SizedBox(),

              // Waktu
              detail.selectTanggal != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          label: const Text('Waktu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        value: detail.selectWaktu,
                        hint: detail.selectWaktu == null
                            ? const Text('Pilih Waktu')
                            : Text('${detail.selectWaktu}'),
                        onChanged: (value) {
                          detail.selectWaktuVaksin(value);
                        },
                        items: detail.vaksin
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
