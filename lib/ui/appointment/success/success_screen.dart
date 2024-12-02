import 'dart:async';
import 'package:finpro_app/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatefulWidget {
 const SuccessScreen({super.key});

 @override
 State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
 @override
 void initState() {
   super.initState();
   // Navigate ke home screen setelah 1 detik
   Timer(const Duration(seconds: 1), () {
     Navigator.pushNamedAndRemoveUntil(
      context,
      '/home', // Named route untuk Home Screen
      (route) => false, // Menghapus semua route sebelumnya
    );
   });
 }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: primaryColor, // warna biru background
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           // svg icon di tengah
           Container(
             width: 80,
             height: 80,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
             ),
             padding: const EdgeInsets.all(16),
             child: SvgPicture.asset(
               'assets/icons/checklist.svg', // ganti dengan path svg icon kamu
             ),
           ),
           const SizedBox(height: 30),
           // teks utama
           const Text(
             'Successfully Booked!',
             style: TextStyle(
               color: Colors.white,
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 10),
           // teks deskripsi
           const Text(
             'Si - Sehat Mobile Apps',
             style: TextStyle(
               color: Colors.white70,
               fontSize: 16,
             ),
           ),
         ],
       ),
     ),
   );
 }
}
