import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:finpro_app/ui/home/components/doctor_booked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'components/action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0, // ngilangin shadow dari AppBar
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi There!', // greeting utama
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 2), // kasih spasi kecil antar teks greeting
              Text(
                'May you always in a good condition', // greeting tambahan
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? Colors.white : const Color(0xFF3F3F46),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.20,
                ),
              ),
              const SizedBox(height: 16), // jarak antara greeting dan search bar
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // toggle light/dark mode
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            },
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.isDarkTheme ? Colors.amberAccent : Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      // search bar untuk symptoms/diseases
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
                    // filter icon yang beda warna sesuai tema
                    themeProvider.isDarkTheme
                        ? 'assets/icons/filter-button-dark.svg'
                        : 'assets/icons/filter-button.svg',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const DoctorBooked(), // section untuk dokter yang sudah di-book
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2, // grid dengan 2 kolom
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true, // biar grid hanya ambil ruang yang dibutuhkan
                children: ActionCard.actionCardList(context), // action card list
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 180, // max height untuk PageView
                ),
                child: PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        // promo card pertama (dynamic sesuai tema)
                        themeProvider.isDarkTheme
                            ? 'assets/images/promotion-card-1-dark.png'
                            : 'assets/images/promotion-card-1.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        // promo card kedua (tetap sama)
                        'assets/images/promotion-card-1.png',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
