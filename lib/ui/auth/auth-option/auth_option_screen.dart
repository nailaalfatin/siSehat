import 'package:finpro_app/ui/auth/auth-option/components/auth_bottons.dart';
import 'package:flutter/material.dart';
import 'components/auth_header.dart';
import 'components/auth_footer.dart';

class AuthOptionScreen extends StatelessWidget {
  const AuthOptionScreen({super.key}); // Konstruktor kelas tanpa parameter khusus

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea( // SafeArea memastikan konten tidak terpotong oleh status bar atau area perangkat lainnya
        child: SingleChildScrollView( // Membuat halaman dapat digulir (scrollable) jika konten melebihi layar
          child: Column( // Menyusun elemen-elemen secara vertikal dalam sebuah kolom
            crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen-elemen di kiri
            children: [
              AuthHeader(), // Menampilkan widget AuthHeader (header aplikasi)
              AuthButtons(screenWidth: 360), // Menampilkan widget AuthButtons dan memberikan lebar layar dinamis
              AuthFooter(), // Menampilkan widget AuthFooter (footer aplikasi)
            ],
          ),
        ),
      ),
    );
  }
}