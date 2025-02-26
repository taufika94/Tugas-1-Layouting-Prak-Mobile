import 'package:flutter/material.dart';
import 'order_page.dart'; // Impor halaman pemesanan

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/croissants.jpg',
                ), // Ganti dengan gambar latar belakang Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten utama
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(
                  0.8,
                ), // Warna latar belakang dengan transparansi
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Ukuran kolom sesuai dengan konten
                children: [
                  Text(
                    'UPN Bakery',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF443627),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Validasi input
                      if (_usernameController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        // Tampilkan pesan kesalahan jika input kosong
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Username dan Password tidak boleh kosong!',
                            ),
                          ),
                        );
                      } else if (_usernameController.text ==
                          _passwordController.text) {
                        // Navigasi ke halaman pemesanan setelah login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => OrderPage()),
                        );
                      } else {
                        // Tampilkan pesan kesalahan jika username dan password tidak cocok
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Username dan Password harus sama!'),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
