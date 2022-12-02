import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/profile_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime birthDay = DateTime.now();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kataSandiController = TextEditingController();
  final TextEditingController konfirmasiKataSandiController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20.83,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ProfileViewModel>(
            builder: (context, profile, child) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: nikController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Masukkan NIK",
                      labelText: "NIK",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'NIK tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: namaController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan nama lengkap",
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: dateController,
                    autofocus: true,
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month_outlined),
                      hintText: profile.selectDate == null
                          ? "dd/mm/yy"
                          : profile.birthday,
                      labelText: "Tanggal Lahir",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pilih Tanggal Lahir';
                      }
                      return null;
                    },
                    onTap: () async {
                      profile.selectDate = await showDatePicker(
                          context: context,
                          initialDate: birthDay,
                          firstDate: DateTime(1960),
                          lastDate: DateTime.now());
                      profile.dateBirthday();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      label: const Text('Jenis Kelamin'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    value: profile.selectjenisKelamin,
                    validator: (value) =>
                        value == null ? 'Pilih jenis kelamin !' : null,
                    hint: profile.selectjenisKelamin == null
                        ? const Text('Pilih jenis kelamin')
                        : Text('${profile.selectjenisKelamin}'),
                    onChanged: (value) {
                      profile.pilihJenisKelamin(value);
                    },
                    items: profile.jenisKelamin
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Masukkan email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: kataSandiController,
                    autofocus: true,
                    obscureText: profile.passwordView,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(profile.passwordView == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          profile.showPassword();
                        },
                      ),
                      hintText: "Masukkan kata sandi",
                      labelText: "Kata Sandi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: konfirmasiKataSandiController,
                    autofocus: true,
                    obscureText: profile.passwordView2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(profile.passwordView2 == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          profile.showPassword2();
                        },
                      ),
                      hintText: "Masukkan ulang kata sandi",
                      labelText: "Konfirmasi Kata Sandi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi kata sandi tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006D39),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
