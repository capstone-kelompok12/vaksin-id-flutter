import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 20.83,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "masukkan nik anda",
                labelText: "NIK",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'masukkan nik anda';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "masukkan nama anda",
                labelText: "Nama",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'masukkan nama anda';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.arrow_drop_down),
                hintText: "masukkan jenis kelamin anda",
                labelText: "Jenis Kelamin",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'masukkan jenis kelamin anda';
                }
                return null;
              },
            ),
            SizedBox(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFFE7F1E8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text(
                        'Laki-laki',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text('Perempuan',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "masukkan email anda",
                labelText: "Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'masukkan email anda';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.visibility_outlined),
                hintText: "masukkan kata sandi anda",
                labelText: "Kata Sandi",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'masukkan kata sandi anda';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.visibility_off_outlined),
                hintText: "masukkan konfirmasi kata sandi anda",
                labelText: "Konfirmasi Kata Sandi",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'masukkan konfirmasi kata sandi anda';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text(
                'Simpan',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D39),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
