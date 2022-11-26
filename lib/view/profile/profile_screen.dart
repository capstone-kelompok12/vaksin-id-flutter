import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 20.83,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0xFFE7F1E8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 76.67,
                    ),
                    Text(
                      'Nama Lengkap',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text('username@gmail.com',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text('Edit Profil',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  trailing:
                      Icon(Icons.arrow_right, color: Colors.black, size: 20),
                ),
                Divider(
                  color: Colors.black26,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.vaccines,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text('Riwayat Vaksin',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  trailing:
                      Icon(Icons.arrow_right, color: Colors.black, size: 20),
                ),
                Divider(
                  color: Colors.black26,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.groups_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text('Anggota Keluarga',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  trailing:
                      Icon(Icons.arrow_right, color: Colors.black, size: 20),
                ),
                Divider(
                  color: Colors.black87,
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Label'),
        ],
      ),
    );
  }
}
