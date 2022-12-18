import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/models/profile/edit_profile_model.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/component/snackbar_message.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime birthDay = DateTime.now();
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kataSandiController = TextEditingController();
  TextEditingController konfirmasiKataSandiController = TextEditingController();
  bool emailValidator(String input) => EmailValidator.validate(input);
  final _formKey = GlobalKey<FormState>();

  // Future _selectDate() async {
  //   DateTime? date = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1980),
  //     lastDate: DateTime.now(),
  //   );
  //   if (date == null) {
  //     dateController.text = '';
  //     return;
  //   }
  //   dateController.text = DateFormat('yyyy-MM-dd').format(date);
  // }

  @override
  void initState() {
    super.initState();
    final profile = Provider.of<ProfileViewModel>(context, listen: false);
    profile.checkGender();
    nikController = TextEditingController(text: profile.profile.dataUser!.nik);
    namaController =
        TextEditingController(text: profile.profile.dataUser!.fullname);
    dateController = TextEditingController(
      text: profile.dateFormat.format(
          DateTime.parse(profile.profile.dataUser!.birthDate!.split('T')[0])),
    );
    genderController = TextEditingController(
        text: profile.profile.dataUser!.gender == 'L'
            ? 'Laki - laki'
            : 'Perempuan');
    emailController =
        TextEditingController(text: profile.profile.dataUser!.email);
    kataSandiController =
        TextEditingController(text: profile.profile.dataUser!.password);
    konfirmasiKataSandiController =
        TextEditingController(text: profile.profile.dataUser!.password);
  }

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
            builder: (context, profile, child) {
              return Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: nikController,
                      readOnly: true,
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
                      textCapitalization: TextCapitalization.words,
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
                        suffixIcon: const Icon(Icons.today),
                        labelText: "Tanggal Lahir",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: profile.selectDate == null
                              ? DateTime.parse(
                                  profile.profile.dataUser!.birthDate!)
                              : DateTime.parse(profile.selectDate!),
                          firstDate: DateTime(1980),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          dateController.text = profile.dateBirthday(date);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField(
                      hint: Text(genderController.text),
                      autofocus: true,
                      decoration: InputDecoration(
                        label: const Text('Jenis Kelamin'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      items: profile.jenisKelamin
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        genderController.text = profile.pilihJenisKelamin(value);
                      },
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
                      height: 36,
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            try {
                              await profile.editUsersProfile(
                                EditProfileModel(
                                  nik: nikController.text,
                                  email: emailController.text,
                                  password: kataSandiController.text,
                                  fullname: namaController.text,
                                  gender: genderController.text == 'Laki - laki'
                                      ? 'L'
                                      : 'P',
                                  phonenum: profile.profile.dataUser?.phoneNum,
                                  birthdate: dateController.text,
                                ),
                              );
                              if (mounted) {}
                              snackbarMessage(context, 'Berhasil Edit Profile');
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationBarScreen(
                                            setIndex: 3),
                                  ),
                                );
                              });
                            } catch (e) {
                              snackbarMessage(context, 'Gagal Edit Profile');
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
