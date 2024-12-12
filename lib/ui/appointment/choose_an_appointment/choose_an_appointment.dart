import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ChooseAnAppointmentScreen extends StatelessWidget {
  const ChooseAnAppointmentScreen({super.key}); // Konstruktor kelas stateless

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
          icon: const Icon(Icons.arrow_back_ios), // Ikon panah untuk kembali
        ),
        title: const Text(
          'Book an Appointment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ), // Judul halaman dengan teks tebal
        ),
        centerTitle: true, // Membuat judul di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), // Memberikan jarak di kiri dan kanan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Konten rata kiri
          children: <Widget>[
            const SizedBox(height: 16), // Jarak atas
            Text(
              "Medical Specialties", // Judul bagian spesialisasi medis
              style: TextStyle(
                fontSize: 18, // Ukuran font judul
                fontWeight: FontWeight.bold, // Judul tebal
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black, // Warna teks hitam
              ),
            ),
            const SizedBox(height: 4), // Jarak bawah judul
            Text(
              "Wide selection of doctor's specialties", // Deskripsi singkat
              style: TextStyle(
                fontSize: 15, 
                color: themeProvider.isDarkTheme ? Colors.white : textSecondaryDark
              ), // Ukuran dan warna teks deskripsi
            ),
            const SizedBox(height: 16), // Jarak bawah deskripsi
            Row(
               children: [
                 Expanded(
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: 'symptoms, diseases...',
                       prefixIcon: const Icon(Icons.search),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(width: 12),
                 SvgPicture.asset(
                  themeProvider.isDarkTheme ? 'assets/icons/filter-button-dark.svg' : 'assets/icons/filter-button.svg'
                 ),
               ],
             ),
            const SizedBox(height: 25), // Jarak setelah pencarian
            Expanded(
              child: ListView(
                children: [
                  // Setiap item spesialisasi medis ditampilkan menggunakan _buildSpecialtyItem
                  _buildSpecialtyItem(
                    context: context,
                    lightImagePath: 'assets/images/ear-logo.png',
                    darkImagePath: 'assets/images/ear-logo-dark.png',
                    title: "Ear, Nose & Throat", // Nama spesialisasi
                    onTap: () {
                      Navigator.pushNamed(context, '/doctor'); // Pindah ke halaman dokter
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildSpecialtyItem(
                    context: context,
                    lightImagePath: 'assets/images/brain-logo.png', // Gambar untuk spesialisasi psikiater
                    darkImagePath: 'assets/images/brain-logo-dark.png',
                    title: "Psychiatrist", // Nama spesialisasi
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildSpecialtyItem(
                    context: context,
                    lightImagePath: 'assets/images/teeth-logo.png', // Gambar untuk spesialisasi dokter gigi
                    darkImagePath: 'assets/images/teeth-logo.png', // Gambar untuk spesialisasi dokter gigi
                    title: "Dentist", // Nama spesialisasi
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildSpecialtyItem(
                    context: context,
                    lightImagePath: 'assets/images/fingers-logo.png', // Gambar untuk spesialisasi dermatologi
                    darkImagePath: 'assets/images/fingers-logo.png', // Gambar untuk spesialisasi dermatologi
                    title: "Dermato-veneerologist", // Nama spesialisasi
                    onTap: () {},
                  ),
                  const SizedBox(height: 16), // Jarak bawah setelah daftar spesialisasi
                  // Menampilkan tombol "See More"
                  ListTile(
                    title: const Text(
                      "See More", // Teks pada tombol
                      style: TextStyle(
                        color: Color(0xFF254EDB), // Warna teks biru
                        fontWeight: FontWeight.bold, // Teks tebal
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Color(0xFF254EDB), size: 17), // Ikon panah ke kanan
                    onTap: () {}, // Aksi saat tombol "See More" ditekan
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat setiap item spesialisasi medis
  Widget _buildSpecialtyItem({
    required BuildContext context,
    required String lightImagePath,
    required String darkImagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final imagePath = themeProvider.isDarkTheme ? darkImagePath : lightImagePath;

    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: themeProvider.isDarkTheme
            ? const Color(0xFF13286D) // warna dark mode
            : const Color(0xFFF9F5FF), // warna light mode
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: 30,
          height: 30,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "Wide selection of doctor's specialties",
        style: TextStyle(fontSize: 12),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFF1E3EAF),
        size: 17,
      ),
      onTap: onTap,
    );
  }
}