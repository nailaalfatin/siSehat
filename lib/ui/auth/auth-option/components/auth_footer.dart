import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key}); // Konstruktor kelas tanpa parameter khusus

  @override
  Widget build(BuildContext context) {
    return Column( // Menggunakan Column untuk menata elemen secara vertikal
      children: [
        // Already have an account (Tanya pengguna apakah sudah punya akun)
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun elemen di tengah secara horizontal
          children: [
            const Text(
              'Already have an account? ', // Teks bertanya apakah sudah punya akun
              style: TextStyle(color: Colors.black54), // Teks berwarna abu-abu
            ),
            GestureDetector(
              onTap: () {
                // Aksi yang akan dilakukan ketika "Sign In" di-tap (Belum diimplementasikan)
              },
              child: const Text(
                'Sign In', // Teks untuk tautan ke halaman login
                style: TextStyle(
                  color: Color(0xFF4267B2), // Warna teks biru
                  fontWeight: FontWeight.bold, // Menebalkan font
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 130), // Jarak vertikal setelah "Already have an account?"
        
        // Terms and Privacy (Ketentuan Layanan dan Kebijakan Privasi)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0), // Padding kiri dan kanan
          child: Column(
            children: [
              const Text(
                'By signing up or logging in, I accept the app\'s', // Teks penjelasan ketentuan
                style: TextStyle(fontSize: 12, color: Colors.black54), // Teks kecil dan abu-abu
                textAlign: TextAlign.center, // Menyusun teks agar rata tengah
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Menyusun elemen dalam row agar rata tengah
                children: [
                  GestureDetector(
                    onTap: () {
                      // Aksi yang akan dilakukan ketika "Terms of Service" di-tap (Belum diimplementasikan)
                    },
                    child: const Text(
                      'Terms of Service', // Teks "Terms of Service"
                      style: TextStyle(
                        color: Color(0xFF4267B2), // Warna biru untuk tautan
                        fontSize: 12, // Ukuran font kecil
                        fontWeight: FontWeight.bold, // Font tebal
                      ),
                    ),
                  ),
                  const Text(' and ', style: TextStyle(fontSize: 12)), // Teks penghubung "dan"
                  GestureDetector(
                    onTap: () {
                      // Aksi yang akan dilakukan ketika "Privacy Policy" di-tap (Belum diimplementasikan)
                    },
                    child: const Text(
                      'Privacy Policy', // Teks "Privacy Policy"
                      style: TextStyle(
                        color: Color(0xFF4267B2), // Warna biru untuk tautan
                        fontSize: 12, // Ukuran font kecil
                        fontWeight: FontWeight.bold, // Font tebal
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}