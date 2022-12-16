import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

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
                    detail.getVaccineSession(detail.detailHf!.vaccine!);
                  },
                  items: detail.detailHf?.vaccine
                      ?.map(
                        (e) => DropdownMenuItem<String>(
                          value: e.name,
                          child: Text(
                            '${e.name}',
                          ),
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
                        hint: detail.selectDosis == null ||
                                detail.vaccineSession!.session!.isEmpty
                            ? const Text('Pilih Dosis')
                            : Text('${detail.selectDosis}'),
                        onChanged: (value) {
                          detail.selectDosisVaksin(value);
                        },
                        items: detail.vaccineSession!.session
                            ?.map(
                              (e) => DropdownMenuItem<String>(
                                value: e.dose.toString(),
                                child: Text(
                                  '${e.dose}',
                                ),
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
                        hint: detail.selectTanggal == null ||
                                detail.vaccineSession!.session!.isEmpty
                            ? const Text('Pilih Tanggal')
                            : Text('${detail.selectTanggal}'),
                        onChanged: (value) {
                          detail.selectTanggalVaksin(value);
                        },
                        items: detail.vaccineSession!.session
                            ?.map(
                              (e) => DropdownMenuItem<String>(
                                value: e.date,
                                child: Text(
                                  '${e.date}',
                                ),
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
                        hint: detail.selectWaktu == null
                            ? const Text('Pilih Waktu')
                            : Text('${detail.selectWaktu}'),
                        onChanged: (value) {
                          detail.selectWaktuVaksin(value);
                          detail.getIdSession(detail.vaccineSession!.session!);
                        },
                        items: detail.vaccineSession!.session
                            ?.map(
                              (e) => DropdownMenuItem<String>(
                                value: '${e.startSession} - ${e.endSession}',
                                child: Text(
                                  '${e.startSession} - ${e.endSession}',
                                ),
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
