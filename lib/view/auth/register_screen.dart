import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/models/auth/register_model.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/auth/widgets/custom_button.dart';
import 'package:vaksin_id_flutter/view/auth/widgets/success_register.dart';
import 'package:vaksin_id_flutter/view_model/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // form
  final _formKey = GlobalKey<FormState>();

  // controller form
  final _nikController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  DateTime birthDate = DateTime.now();

  String dropdownJeniskelamin = 'Pilih jenis kelamin';
  String valueGender = '';

  //Untuk show dan hidden password dan confirm
  bool _passwordVisible = false;
  bool _passwordConfirmVisible = false;

  late ValueNotifier<bool> _isLoading;

  @override
  void initState() {
    _isLoading = ValueNotifier<bool>(false);
    super.initState();
  }

  @override
  void dispose() {
    _nikController.dispose();
    _fullnameController.dispose();
    _birthdateController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel registerAuth = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar',
          style: blackTextStyle.copyWith(
            fontSize: 22,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: _nikController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text('NIK'),
                    hintText: 'Masukkan NIK',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  validator: (value) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{16}$)';
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return ("Masukkan NIK anda.");
                    }
                    if (!regExp.hasMatch(value)) {
                      return ("NIK harus 16 digit.");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: _fullnameController,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text('Nama'),
                    hintText: 'Masukkan nama lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Masukkan Nama anda.");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: _birthdateController,
                  textInputAction: TextInputAction.next,
                  readOnly: true,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: const Icon(Icons.today),
                    label: const Text('Tanggal lahir'),
                    hintText: 'Masukkan tanggal lahir',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onTap: () async {
                    final DateTime? datePick = await showDatePicker(
                      context: context,
                      initialDate: birthDate,
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now(),
                    );

                    if (datePick != null && datePick != birthDate) {
                      setState(() {
                        birthDate = datePick;
                        _birthdateController.text = DateFormat('yyyy-MM-dd')
                            .format(birthDate)
                            .toString();
                      });
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Masukkan Tanggal anda.");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text('Jenis Kelamin'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return ("Pilih jenis kelamin anda.");
                    }
                    return null;
                  },
                  hint: Text(dropdownJeniskelamin),
                  onChanged: (value) {
                    setState(() {
                      dropdownJeniskelamin = value!;
                      valueGender = value == 'Laki-laki' ? 'L' : 'P';
                    });
                  },
                  items: [
                    'Laki-laki',
                    'Perempuan',
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text('Email'),
                    hintText: 'Masukkan email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukan Email!';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Masukkan email yang valid!");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text('Phone'),
                    hintText: 'Masukkan nomor',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukan Nomormu!';
                    }

                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  obscuringCharacter: '*',
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text('Kata sandi'),
                    hintText: 'Masukkan kata sandi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Masukan Password!");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Masukkan Kata Sandi yang Valid (Min. 6 Karakter)");
                    }
                    return null;
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 16),
              //   child: TextFormField(
              //     controller: _confirmPasswordController,
              //     obscureText: !_passwordConfirmVisible,
              //     obscuringCharacter: '*',
              //     textInputAction: TextInputAction.done,
              //     decoration: InputDecoration(
              //       floatingLabelBehavior: FloatingLabelBehavior.always,
              //       label: const Text('Konfirmasi kata sandi'),
              //       hintText: 'Masukkan ulang kata sandi',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(4),
              //       ),
              //       suffixIcon: IconButton(
              //         onPressed: () {
              //           setState(() {
              //             _passwordConfirmVisible = !_passwordConfirmVisible;
              //           });
              //         },
              //         icon: Icon(
              //           _passwordConfirmVisible
              //               ? Icons.visibility
              //               : Icons.visibility_off,
              //         ),
              //       ),
              //     ),
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return ("Masukan Ulang Password !");
              //       }
              //       if (_confirmPasswordController.text !=
              //           _passwordController.text) {
              //         return "Password tidak sama";
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 16.0,
              ),
              Text.rich(
                TextSpan(
                  text: 'Dengan mendaftar Saya menyetujui ',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  children: [
                    TextSpan(
                      text: 'Syarat dan Ketentuan ',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    TextSpan(
                      text: 'serta ',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    TextSpan(
                      text: 'Kebijakan Privasi ',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    TextSpan(
                      text: 'yang berlaku.',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'Daftar',
                bgColor: primaryColor,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await registerAuth.postRegister(
                      RegisterModel(
                        nik: _nikController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        fullname: _fullnameController.text,
                        phonenum: _phoneController.text,
                        gender: valueGender,
                        birthdate: _birthdateController.text,
                      ),
                    );
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),
                      context: context,
                      builder: (context) => const SuccessRegister(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
