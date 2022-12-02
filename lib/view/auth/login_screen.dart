import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/models/auth/login_model.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/auth/register_screen.dart';
import 'package:vaksin_id_flutter/view/auth/widgets/custom_button.dart';
import 'package:vaksin_id_flutter/view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late ValueNotifier<bool> _obscureText;
  late ValueNotifier<bool> _isLoading;

  @override
  void initState() {
    _obscureText = ValueNotifier(true);
    _isLoading = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel loginAuth = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(
                    top: 100,
                    bottom: 50,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo_vaksin.png'),
                    ),
                  ),
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
                child: ValueListenableBuilder<bool>(
                  valueListenable: _obscureText,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText.value,
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
                            _obscureText.value = !_obscureText.value;
                          },
                          icon: Icon(
                            _obscureText.value
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
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Lupa kata sandi ?',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              CustomButton(
                text: 'Masuk',
                bgColor: primaryColor,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  
                    String token = await loginAuth.postLogin(
                      LoginModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                    await loginAuth.setToken(token);
                    
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => BottomnavScreen(),
                    //   ),
                    // );
                  }
                },
              ),
              const SizedBox(
                height: 200.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun ?',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
            child: Text(
              'Daftar',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
