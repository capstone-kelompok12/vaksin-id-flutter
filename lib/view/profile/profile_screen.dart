import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/component/snackbar_message.dart';
import 'package:vaksin_id_flutter/view/profile/edit_profile_screen.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context, listen: false)
        .getUsersProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: SizedBox(
                width: 360,
                height: 174,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7F1E8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Consumer<ProfileViewModel>(
                      builder: (context, value, child) {
                        final data = value.profile;
                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 76.67,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.dataUser?.fullname ?? '',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              data.dataUser?.email ?? '',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: blackColor,
                  ),
                  title: Text(
                    'Edit Profile',
                    style: blackTextStyle.copyWith(),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: blackColor,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
                Divider(
                  color: greyColor,
                  thickness: 1,
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: blackColor,
                      ),
                      title: Text(
                        'Keluar',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: blackColor,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Center(
                              child: Text(
                                'Keluar',
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            content: Text(
                              'Kamu yakin ingin keluar?',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () async {
                                  final prefs = SharedService();
                                  prefs.deleteToken();
                                  if (mounted) {
                                    snackbarMessage(context, 'Berhasil logout');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(
                      color: greyColor,
                      thickness: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
