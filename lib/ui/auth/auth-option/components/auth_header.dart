import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key}); // Konstruktor kelas, tidak membutuhkan parameter khusus

  @override
  Widget build(BuildContext context) {
    return Column( // Menggunakan Column untuk menata elemen-elemen secara vertikal
      crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen-elemen di sisi kiri
      children: [
        // Header Image
        Image.asset(
          'assets/images/illustration.png', // Gambar header yang diambil dari direktori assets
          height: 250, // Menentukan tinggi gambar
          width: double.infinity, // Lebar gambar mengikuti lebar layar
          fit: BoxFit.cover, // Menyesuaikan gambar agar menutupi seluruh area tanpa merusak proporsi
        ),
        const SizedBox(height: 20), // Memberikan jarak vertikal setelah gambar
        // App Title and Subtitle dengan Padding
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0), // Memberikan jarak horizontal kiri dan kanan pada teks
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Menempatkan teks di kiri
            children: [
              Text(
                'Si - Sehat', // Judul aplikasi
                style: TextStyle(
                  fontSize: 28, // Ukuran font judul
                  fontWeight: FontWeight.bold, // Menebalkan font judul
                  color: Colors.black, // Warna teks judul hitam
                ),
              ),
              SizedBox(height: 20), // Jarak vertikal antara judul dan subjudul
              Text(
                'Begin your journey to better health!', // Subjudul aplikasi
                style: TextStyle(
                  fontSize: 16, // Ukuran font subjudul
                  color: Colors.black54, // Warna teks subjudul sedikit lebih terang (abu-abu)
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50), // Jarak vertikal setelah subjudul
      ],
    );
  }
}