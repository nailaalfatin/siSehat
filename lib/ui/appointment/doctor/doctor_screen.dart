import 'package:finpro_app/consts.dart';
import 'package:finpro_app/models/doctors.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:finpro_app/ui/appointment/doctor/components/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Doctorscreen extends StatelessWidget {
  const Doctorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: themeProvider.isDarkTheme ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Ear, Nose & Throat",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Filter Row
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
            const SizedBox(height: 20),
            // Filter Buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(label: "Available Today"),
                FilterButton(label: "Gender"),
                FilterButton(label: "Price"),
              ],
            ),
            const SizedBox(height: 16),
            // Doctor Cards
            Expanded(
              child: ListView.builder(
                itemCount: Doctor.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = Doctor.doctors[index];
                  return DoctorCard(doctor: doctor, onTap: () { Navigator.pushNamed(context, '/booking'); }); // Pass doctor object
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;

  const FilterButton({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: themeProvider.isDarkTheme ? Colors.grey.shade300 : textColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: themeProvider.isDarkTheme ? textSecondaryDark : textColor,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(width: 3),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}