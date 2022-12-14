import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';

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
  bool emailValidator(String input) => EmailValidator.validate(input);
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      hintText: "contoh: 6284617293084713",
                      labelText: "NIK",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) => value == ''
                        ? 'NIK tidak boleh kosong.'
                        : value!.length < 16
                            ? 'NIK harus 16 digit.'
                            : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: namaController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      hintText: "contoh: john Doe",
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
                    height: 16,
                  ),
                  TextFormField(
                    controller: dateController,
                    autofocus: true,
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
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
                        lastDate: DateTime.now(),
                      );
                      profile.dateBirthday();
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
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
                    height: 16,
                  ),
                  TextFormField(
                    controller: emailController,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      hintText: "contoh: hi@gmail.com",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) => value == ''
                        ? 'Email tidak boleh kosong.'
                        : !emailValidator(value!)
                            ? 'Email tidak sesuai.'
                            : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: kataSandiController,
                    autofocus: true,
                    obscureText: profile.passwordView,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      suffixIcon: IconButton(
                        icon: Icon(profile.passwordView == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          profile.showPassword();
                        },
                      ),
                      hintText: "contoh: Ajsk01.",
                      labelText: "Kata Sandi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) => value == ''
                        ? 'Kata sandi tidak boleh kosong.'
                        : value!.length < 6
                            ? 'Kata sandi minimal 6 karakter.'
                            : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: konfirmasiKataSandiController,
                    autofocus: true,
                    obscureText: profile.passwordView2,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      suffixIcon: IconButton(
                        icon: Icon(profile.passwordView2 == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          profile.showPassword2();
                        },
                      ),
                      hintText: "contoh: Ajsk01.",
                      labelText: "Konfirmasi Kata Sandi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    validator: (value) => value == ''
                        ? 'Konfirmasi kata sandi tidak boleh kosong.'
                        : value != kataSandiController.text
                            ? 'kata sandi tidak sesuai.'
                            : null,
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
