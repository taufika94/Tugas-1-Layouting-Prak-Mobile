import 'package:flutter/material.dart';
import 'login_page.dart'; // Impor halaman login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakery App',
      theme: ThemeData(
        primaryColor: Color(0xFF443627), // Warna utama
        scaffoldBackgroundColor: Color(0xFFF2F6D0), // Latar belakang
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF443627), // Warna AppBar
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), // Warna teks AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xFF443627),
            backgroundColor: Color(0xFFEFDCAB), // Warna tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ), // Padding
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF443627)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(255, 153, 134, 87)),
          ),
          labelStyle: TextStyle(color: Color(0xFF443627)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
