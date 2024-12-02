import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold), // Judul halaman dengan teks tebal
        ),
        centerTitle: true, // Membuat judul di tengah
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Ukuran bawah AppBar (divider)
          child: Divider(
            thickness: 1.0, // Ketebalan divider
            height: 1.0, // Tinggi divider
            color: Colors.grey[300], // Warna divider abu-abu
          ),
        ),
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
                fontSize: 20, // Ukuran font judul
                fontWeight: FontWeight.bold, // Judul tebal
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black, // Warna teks hitam
              ),
            ),
            const SizedBox(height: 4), // Jarak bawah judul
            Text(
              "Wide selection of doctor's specialties", // Deskripsi singkat
              style: TextStyle(fontSize: 16, color: themeProvider.isDarkTheme ? Colors.white : textSecondaryDark), // Ukuran dan warna teks deskripsi
            ),
            const SizedBox(height: 16), // Jarak bawah deskripsi
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'symptoms, diseases...', // Placeholder untuk pencarian
                      prefixIcon: const Icon(Icons.search), // Ikon pencarian di awal
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Sudut kotak pencarian melengkung
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Jarak antara TextField dan ikon filter
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Sudut melengkung pada filter button
                    color: const Color(0xFFF9F5FF), // Warna latar belakang button filter
                  ),
                  child: IconButton(
                    onPressed: () {}, // Fungsi filter belum ditambahkan
                    icon: const Icon(Icons.filter_alt_outlined), // Ikon filter
                    color: Colors.black, // Warna ikon hitam
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Jarak setelah pencarian
            Expanded(
              child: ListView(
                children: [
                  // Setiap item spesialisasi medis ditampilkan menggunakan _buildSpecialtyItem
                  _buildSpecialtyItem(
                    context: context,
                    imagePath: 'assets/images/ear-logo.png', // Gambar untuk spesialisasi THT
                    title: "Ear, Nose & Throat", // Nama spesialisasi
                    onTap: () {
                      Navigator.pushNamed(context, '/doctor'); // Pindah ke halaman dokter
                    },
                  ),
                  _buildSpecialtyItem(
                    context: context,
                    imagePath: 'assets/images/brain-logo.png', // Gambar untuk spesialisasi psikiater
                    title: "Psychiatrist", // Nama spesialisasi
                    onTap: () {},
                  ),
                  _buildSpecialtyItem(
                    context: context,
                    imagePath: 'assets/images/teeth-logo.png', // Gambar untuk spesialisasi dokter gigi
                    title: "Dentist", // Nama spesialisasi
                    onTap: () {},
                  ),
                  _buildSpecialtyItem(
                    context: context,
                    imagePath: 'assets/images/fingers-logo.png', // Gambar untuk spesialisasi dermatologi
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
    required String imagePath, // Gambar spesialisasi
    required String title, // Nama spesialisasi
    required VoidCallback onTap, // Fungsi callback untuk klik
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30, // Ukuran lingkaran di samping teks
        backgroundColor: const Color(0xFFF9F5FF), // Warna latar belakang lingkaran
        child: Image.asset(
          imagePath, // Menampilkan gambar spesialisasi
          fit: BoxFit.contain, // Menyesuaikan ukuran gambar agar pas dalam lingkaran
          width: 30,
          height: 30,
        ),
      ),
      title: Text(
        title, // Menampilkan nama spesialisasi
        style: const TextStyle(fontWeight: FontWeight.bold), // Nama tebal
      ),
      subtitle: const Text(
        "Wide selection of doctor's specialties", // Deskripsi pendek
        style: TextStyle(fontSize: 12), // Ukuran font deskripsi
      ),
      trailing: const Icon(Icons.arrow_forward_ios,
          color: Color(0xFF1E3EAF), size: 17), // Ikon panah ke kanan
      onTap: onTap, // Memanggil fungsi onTap yang diteruskan dari parameter
    );
  }
}