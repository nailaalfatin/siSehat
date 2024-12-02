import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  final double screenWidth; // Variabel untuk lebar layar

  const AuthButtons({super.key, required this.screenWidth}); // Konstruktor untuk menerima screenWidth

  @override
  Widget build(BuildContext context) {
    return Column( // Menggunakan Column untuk menyusun tombol secara vertikal
      children: [
        // Button: Continue With Phone Number
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Memberikan padding horizontal
          child: SizedBox(
            width: screenWidth, // Lebar tombol disesuaikan dengan lebar layar
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF254EDB), // Warna latar belakang tombol
                padding: const EdgeInsets.symmetric(vertical: 16), // Padding vertikal tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut tombol melengkung
                ),
                elevation: 1, // Efek bayangan tombol
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home'); // Navigasi ke halaman home
              },
              child: const Text(
                'Continue With Phone Number', // Teks pada tombol
                style: TextStyle(fontSize: 16, color: Colors.white), // Gaya teks tombol
              ),
            ),
          ),
        ),
        const SizedBox(height: 20), // Jarak vertikal antara tombol
        // Button: Sign in with Google
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Padding horizontal
          child: SizedBox(
            width: screenWidth, // Lebar tombol disesuaikan dengan lebar layar
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Warna latar belakang tombol
                padding: const EdgeInsets.symmetric(vertical: 16), // Padding vertikal
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut tombol melengkung
                  side: const BorderSide(color: Colors.black12), // Border hitam tipis
                ),
                elevation: 1, // Efek bayangan tombol
              ),
              onPressed: () {
                // Navigasi atau fungsi terkait Google sign-in
              },
              icon: Image.asset(
                'assets/images/google-logo.png', // Menampilkan logo Google
                width: 24,
                height: 24,
              ),
              label: const Text(
                'Sign in with Google', // Teks pada tombol
                style: TextStyle(fontSize: 16, color: Colors.black), // Gaya teks tombol
              ),
            ),
          ),
        ),
        const SizedBox(height: 20), // Jarak vertikal antara tombol
        // Button: Sign in with Apple
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Padding horizontal
          child: SizedBox(
            width: screenWidth, // Lebar tombol disesuaikan dengan lebar layar
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3EAF), // Warna latar belakang tombol
                padding: const EdgeInsets.symmetric(vertical: 16), // Padding vertikal
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut tombol melengkung
                ),
                elevation: 1, // Efek bayangan tombol
              ),
              onPressed: () {
                // Navigasi atau fungsi terkait Apple sign-in
              },
              icon: const Icon(
                Icons.apple, // Ikon Apple pada tombol
                color: Colors.white, // Warna ikon putih
                size: 30, // Ukuran ikon
              ),
              label: const Text(
                'Sign in with Apple', // Teks pada tombol
                style: TextStyle(fontSize: 16, color: Colors.white), // Gaya teks tombol
              ),
            ),
          ),
        ),
        const SizedBox(height: 24), // Jarak vertikal setelah tombol
      ],
    );
  }
}