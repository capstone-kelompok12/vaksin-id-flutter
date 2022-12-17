import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

class FormBook extends StatelessWidget {
  FormBook({super.key});

  final GlobalKey<FormFieldState> keyDropDosis = GlobalKey();
  final GlobalKey<FormFieldState> keyDropTanggal = GlobalKey();
  final GlobalKey<FormFieldState> keyDropWaktu = GlobalKey();

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
                    if (detail.selectVaksin != null) {
                      detail.listVaccine?.clear();
                      detail.listSession?.clear();
                      detail.selectDosisVaksin(null);
                      detail.selectTanggalVaksin(null);
                      keyDropDosis.currentState?.reset();
                    }
                    detail.selectJenisVaksin(value);
                    detail.getVaccineDose();
                  },
                  items: detail.detailVaccine
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
                        key: keyDropDosis,
                        decoration: InputDecoration(
                          label: const Text('Dosis'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        hint: detail.selectDosis == null ||
                                detail.listVaccine!.isEmpty
                            ? const Text('Pilih Dosis')
                            : Text('${detail.selectDosis}'),
                        onChanged: (value) {
                          if (detail.selectDosis != null) {
                            // detail.listVaccine?.clear();
                            detail.listSession?.clear();
                            // detail.selectDosisVaksin(null);
                            detail.selectTanggalVaksin(null);
                            keyDropTanggal.currentState?.reset();
                            keyDropWaktu.currentState?.reset();
                          }
                          detail.selectDosisVaksin(int.parse(value!));
                          detail.getVaccineSession();
                        },
                        items: detail.listVaccine
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
                        key: keyDropTanggal,
                        decoration: InputDecoration(
                          label: const Text('Tanggal'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        // value: detail.selectTanggal,
                        hint: detail.selectTanggal == null ||
                                detail.listVaccine!.isEmpty
                            ? const Text('Pilih Tanggal')
                            : Text('${detail.selectTanggal}'),
                        onChanged: (value) {
                          detail.selectWaktuVaksin(null);
                          keyDropWaktu.currentState?.reset();
                          detail.selectTanggalVaksin(detail.formatter
                              .format(DateTime.parse(value!.split('T')[0])));
                          detail.getVaccineSessionTime();
                        },
                        items: detail.listSession!
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: '${e.date}',
                                child: Text(
                                  detail.formatter.format(
                                      DateTime.parse(e.date!.split('T')[0])),
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
                        key: keyDropWaktu,
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
                          detail.getIdSession(detail.sessionTime!);
                        },
                        items: detail.sessionTime
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
