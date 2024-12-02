import 'package:finpro_app/consts.dart';
import 'package:finpro_app/models/doctors.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:finpro_app/ui/appointment/doctor/components/doctor_card.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          "Ear, Nose & Throat",
          style: TextStyle(color:themeProvider.isDarkTheme ? Colors.white : textColor),
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
                      hintText: 'Search Doctor',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF9F5FF),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                  ),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textSecondaryDark),
          ),
          const SizedBox(width: 3),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}