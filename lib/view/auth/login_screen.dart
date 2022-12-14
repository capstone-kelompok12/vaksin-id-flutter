import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/auth/login_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/auth/register_screen.dart';
import 'package:vaksin_id_flutter/view/auth/widgets/loading_screen.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/component/snackbar_message.dart';
import 'package:vaksin_id_flutter/view_model/auth/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _passwordVisible = ValueNotifier<bool>(true);
  final _isLoading = ValueNotifier<bool>(false);

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
      body: Stack(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        prefixIcon: const Icon(Icons.mail),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: const Text('Email'),
                        hintText: 'Masukkan email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong.';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Email tidak terdaftar atau salah.");
                        }
            
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _passwordVisible,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: _passwordController,
                          obscureText: _passwordVisible.value,
                          obscuringCharacter: '*',
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: const Text('Kata sandi'),
                            hintText: 'Masukkan kata sandi',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _passwordVisible.value = !_passwordVisible.value;
                              },
                              icon: Icon(
                                _passwordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Kata sandi tidak boleh kosong.");
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
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ),
                    child: Text(
                      'Lupa kata sandi ?',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 32,
                      bottom: 16,
                    ),
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) return;
                        _isLoading.value = true;
            
                        SharedService prefs = SharedService(); // }
                        try {
                          String token = await loginAuth.postLogin(
                            LoginModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                          await prefs.saveToken(token);
            
                          if (mounted) {
                            snackbarMessage(context, 'Login Berhasil');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarScreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          snackbarMessage(context, 'Email atau Password salah');
                        }
                        _isLoading.value = false;
                      },
                      child: Text(
                        'Masuk',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _isLoading,
            builder: (context, value, child) {
              return (value)
                  ? const Positioned.fill(
                      child: LoadingScreen(),
                    )
                  : const SizedBox();
            },
          ),
        ],
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
