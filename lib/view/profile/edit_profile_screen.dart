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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ProfileViewModel>(
            builder: (context, profile, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nikController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "masukkan nik anda",
                    labelText: "NIK",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                  controller: namaController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "masukkan nama anda",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'masukkan tanggal lahir anda';
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
                      borderRadius: BorderRadius.circular(10),
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
                    hintText: "masukkan email anda",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                    hintText: "masukkan kata sandi anda",
                    labelText: "Kata Sandi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                    hintText: "masukkan konfirmasi kata sandi anda",
                    labelText: "Konfirmasi Kata Sandi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
