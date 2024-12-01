import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:finpro_app/ui/booking/booking_screen.dart';
import 'package:finpro_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //placeholder tamplate untuk theme provider yg belum terdefinisi
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: const SiSehat(),
    ),
  );
}

class SiSehat extends StatefulWidget {
  const SiSehat({super.key});

  @override
  State<SiSehat> createState() => _SiSehatState();
}

class _SiSehatState extends State<SiSehat> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SiSehat', // untuk menampilkan nama aplikasi di Task Switcher
            theme: ThemeData(
              brightness: themeProvider.isDarkTheme ? Brightness.dark :  Brightness.light, //untukk proses perubahan tema
              scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white, //kita spesifikasi biar dia ga jelek pas dark mode
              fontFamily: 'Manrope',
              visualDensity: VisualDensity.adaptivePlatformDensity, //mengatur kepadatan di setiap screen
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Color(0xFF757575)), //textColor itu ngambil dari consts.dart
                bodySmall: TextStyle(color: Color(0xFF757575))
              )
            ),
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/booking': (context) => const BookingScreen(),
          }
        );
      }
    );
  }
}