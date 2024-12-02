import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DoctorBooked extends StatelessWidget {
  const DoctorBooked({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkTheme ? primaryDarkColor : primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/doctor-booked.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Stone Gaze',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkTheme ? const Color(0xFF18181B) : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ear, Nose & Throat specialist',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: themeProvider.isDarkTheme ? const Color(0xFF3F3F46) : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/chat.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: themeProvider.isDarkTheme ? const Color(0xFFC6D4F1) :  const Color(0xFF183188),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Wed, 10 Jan, 2024',
                      style: TextStyle(
                        fontSize: 13,
                        color: themeProvider.isDarkTheme ? const Color(0xFF3F3F46) : Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/time.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Morning set: 11:00',
                      style: TextStyle(
                        fontSize: 13,
                        color: themeProvider.isDarkTheme ? const Color(0xFF3F3F46) : Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
