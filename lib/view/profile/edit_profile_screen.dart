import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
              hintText: "masukkan nik anda",
              labelText: "NIK",
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'masukkan nik anda';
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            decoration: new InputDecoration(
              hintText: "masukkan nama anda",
              labelText: "Nama",
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'masukkan nama anda';
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            decoration: new InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down),
              hintText: "masukkan jenis kelamin anda",
              labelText: "Jenis Kelamin",
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'masukkan jenis kelamin anda';
              }
              return null;
            },
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Laki-laki',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text('Perempuan',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                ],
              ),
            ),
            color: Color(0xFFE7F1E8),
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: new InputDecoration(
              hintText: "masukkan email anda",
              labelText: "Email",
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'masukkan email anda';
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            obscureText: true,
            decoration: new InputDecoration(
              suffixIcon: Icon(Icons.visibility_outlined),
              hintText: "masukkan kata sandi anda",
              labelText: "Kata Sandi",
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'masukkan kata sandi anda';
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            obscureText: true,
            decoration: new InputDecoration(
              suffixIcon: Icon(Icons.visibility_off_outlined),
              hintText: "masukkan konfirmasi kata sandi anda",
              labelText: "Konfirmasi Kata Sandi",
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'masukkan konfirmasi kata sandi anda';
              }
              return null;
            },
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    'Simpan',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            color: Color(0xFF006D39),
          ),
        ],
      ),
    );
  }
}
