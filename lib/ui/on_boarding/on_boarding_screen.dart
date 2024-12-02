import 'package:finpro_app/consts.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState(); // Menghubungkan widget dengan State-nya.
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Data onboarding berupa gambar, judul, dan deskripsi untuk setiap slide.
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding-1.png", // Gambar untuk slide pertama
      "title": "Welcome !", // Judul untuk slide pertama
      "subtitle":
          "We will assist you in efficiently and easily \nscheduling appointments with doctors. \nLet's get started!" // Deskripsi slide pertama
    },
    {
      "image": "assets/images/onboarding-2.png", // Gambar slide kedua
      "title": "Choose Specialization", // Judul slide kedua
      "subtitle":
          "Select the medical specialization you need \nso we can tailor your \nexperience." // Deskripsi slide kedua
    },
    {
      "image": "assets/images/onboarding-3.png", // Gambar slide ketiga
      "title": "Schedule First Appointment", // Judul slide ketiga
      "subtitle":
          "Choose a suitable time and date to meet your \npreferred doctor. Begin your journey to better \nhealth!" // Deskripsi slide ketiga
    },
  ];

  int currentIndex = 0; // Menyimpan index slide yang sedang ditampilkan, dimulai dari 0.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFFD), // Warna latar belakang aplikasi onboarding.
      body: Column(
        children: [
          // Bagian ini untuk menampilkan gambar pada setiap slide.
          Expanded(
            flex: 2, // Memberikan lebih banyak ruang untuk gambar.
            child: Image.asset(
              onboardingData[currentIndex]["image"]!, // Menampilkan gambar berdasarkan index aktif.
              fit: BoxFit.cover, // Memastikan gambar terisi seluruh ruang yang tersedia.
            ),
          ),
          // Bagian ini untuk menampilkan teks (judul, deskripsi) dan tombol-tombol.
          Expanded(
            flex: 1, // Memberikan sedikit ruang untuk teks dan tombol.
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24), // Memberikan jarak di sisi kiri dan kanan.
              decoration: const BoxDecoration(
                color: Colors.white, // Latar belakang putih untuk bagian konten teks.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), // Sudut kiri atas melengkung.
                  topRight: Radius.circular(24), // Sudut kanan atas melengkung.
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Membuat konten rata kiri.
                mainAxisAlignment: MainAxisAlignment.center, // Menjaga konten tetap di tengah secara vertikal.
                children: [
                  // Baris indikator untuk menunjukkan slide mana yang sedang aktif.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Mengatur indikator ke kiri.
                    children: List.generate(
                      onboardingData.length, // Membuat indikator sebanyak jumlah slide.
                      (index) => _buildIndicator(isActive: index == currentIndex), // Menandakan slide aktif.
                    ),
                  ),
                  const SizedBox(height: 24), // Memberikan jarak antara indikator dan judul.
                  // Menampilkan judul untuk slide yang sedang aktif.
                  Text(
                    onboardingData[currentIndex]["title"]!, // Menampilkan judul slide berdasarkan index aktif.
                    style: const TextStyle(
                      fontSize: 24, // Ukuran font untuk judul.
                      fontWeight: FontWeight.bold, // Menebalkan teks judul.
                      color: textColor, // Warna teks berdasarkan konstanta.
                    ),
                  ),
                  const SizedBox(height: 10), // Memberikan jarak antara judul dan deskripsi.
                  // Menampilkan deskripsi untuk slide yang sedang aktif.
                  Text(
                    onboardingData[currentIndex]["subtitle"]!, // Menampilkan deskripsi slide.
                    style: const TextStyle(
                      fontSize: 14, // Ukuran font untuk deskripsi.
                      color: textColor, // Warna teks untuk deskripsi.
                    ),
                  ),
                  const SizedBox(height: 70), // Memberikan jarak antara deskripsi dan tombol.
                  // Baris yang berisi tombol Skip dan Next.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menempatkan tombol Skip di kiri dan tombol Next di kanan.
                    children: [
                      // Tombol Skip untuk kembali ke slide sebelumnya.
                      SizedBox(
                        width: 175, // Lebar tombol Skip.
                        height: 50, // Tinggi tombol Skip.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (currentIndex > 0) {
                                currentIndex--; // Menurunkan index jika bukan di slide pertama.
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Warna tombol putih.
                            foregroundColor: Colors.black, // Warna teks tombol hitam.
                            side: const BorderSide(color: Colors.black26), // Border abu-abu pada tombol.
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Sudut tombol melengkung.
                            ),
                          ),
                          child: const Text("Skip"), // Teks pada tombol Skip.
                        ),
                      ),
                      // Tombol Next untuk melanjutkan ke slide berikutnya.
                      SizedBox(
                        width: 175, // Lebar tombol Next.
                        height: 50, // Tinggi tombol Next.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (currentIndex < onboardingData.length - 1) {
                                currentIndex++; // Menambah index untuk melanjutkan ke slide berikutnya.
                              } else {
                                Navigator.popAndPushNamed(context, '/auth-option'); // Jika sudah di slide terakhir, pindah ke halaman autentikasi.
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor, // Warna tombol dari konstanta.
                            foregroundColor: Colors.white, // Warna teks tombol putih.
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Sudut tombol melengkung.
                            ),
                          ),
                          child: Text(
                            currentIndex == onboardingData.length - 1
                                ? "Get Started!" // Teks tombol jika sudah di slide terakhir.
                                : "Next", // Teks tombol jika belum di slide terakhir.
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat indikator slide aktif atau tidak.
  Widget _buildIndicator({required bool isActive}) {
    return Container(
      width: 45, // Lebar indikator.
      height: 4, // Tinggi indikator.
      margin: const EdgeInsets.symmetric(horizontal: 5), // Jarak antar indikator.
      decoration: BoxDecoration(
        color: isActive ? primaryColor : const Color(0xFFDADADA), // Warna indikator aktif atau tidak aktif.
        borderRadius: BorderRadius.circular(2), // Sudut indikator melengkung.
      ),
    );
  }
}