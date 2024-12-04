import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:finpro_app/ui/appointment-with-qr/appointment_screen.dart';
import 'package:finpro_app/ui/appointment-with-qr/scanner_screen.dart';
import 'package:finpro_app/ui/appointment/booking/booking_screen.dart';
import 'package:finpro_app/ui/appointment/choose_an_appointment/choose_an_appointment.dart';
import 'package:finpro_app/ui/appointment/doctor/doctor_screen.dart';
import 'package:finpro_app/ui/appointment/payment/payment_screen.dart';
import 'package:finpro_app/ui/appointment/schedule/schedule_screen.dart';
import 'package:finpro_app/ui/appointment/success/success_screen.dart';
import 'package:finpro_app/ui/auth/auth-option/auth_option_screen.dart';
import 'package:finpro_app/ui/auth/login/login_screen.dart';
import 'package:finpro_app/ui/auth/register/register_screen.dart';
import 'package:finpro_app/ui/home/home_screen.dart';
import 'package:finpro_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:finpro_app/ui/splash_screen.dart';
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
          initialRoute: '/',
          routes: {
            '/' : (context) => const SplashScreen(),
            '/on-boarding' : (context) => const OnboardingScreen(),
            '/auth-option' : (context) => const AuthOptionScreen(),
            '/login' : (context) => LoginScreen(),
            '/register' : (context) => RegisterScreen(),
            '/home': (context) => const HomeScreen(),
            '/choose-appointment' : (context) => const ChooseAnAppointmentScreen(),
            '/doctor' : (context) => const Doctorscreen(),
            '/booking': (context) => const BookingScreen(),
            '/schedule': (context) => const ScheduleScreen(),
            '/payment': (context) => const PaymentScreen(),
            '/success': (context) => const SuccessScreen(),
            '/appointment-with-qr': (context) => const AppointmentScreen(),
            '/qr': (context) => const ScannerScreen(),
          }
        );
      }
    );
  }
}