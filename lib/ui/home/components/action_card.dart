import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color Function(BuildContext) getColor;
  final String iconPath;
  final VoidCallback onTap;  // Tambahkan onTap untuk navigasi

  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.getColor,
    required this.iconPath,
    required this.onTap,  // Tambahkan onTap ke dalam constructor
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final color = getColor(context);

    return GestureDetector(
      onTap: onTap,  // Saat card diklik, lakukan navigasi
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconPath,
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? textPrimaryDark : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkTheme ? textSecondaryDark : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static List<Widget> actionCardList(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

  return [
    ActionCard(
      title: 'Book an Appointment',
      subtitle: 'Find a Doctor',
      getColor: (ctx) =>
          themeProvider.isDarkTheme ? const Color(0xFF13286D) : const Color(0xFFF9F5FF),
      iconPath: themeProvider.isDarkTheme
          ? 'assets/icons/menu-board-dark.svg'
          : 'assets/icons/menu-board.svg',
      onTap: () {
        Navigator.pushNamed(context, '/choose-appointment');
      },
    ),
    ActionCard(
      title: 'Appointment with QR',
      subtitle: 'Hassle-free queuing',
      getColor: (ctx) =>
          themeProvider.isDarkTheme ? const Color(0xFF084C2E) : const Color(0xFFEDFCF2),
      iconPath: themeProvider.isDarkTheme
          ? 'assets/icons/scan-dark.svg'
          : 'assets/icons/scan.svg',
      onTap: () {
        Navigator.pushNamed(context, '/appointment-with-qr');
      },
    ),
    ActionCard(
      title: 'Request Consultation',
      subtitle: 'Talk to specialist',
      getColor: (ctx) =>
          themeProvider.isDarkTheme ? const Color.fromARGB(255, 148, 77, 61) : const Color(0xFFFEF6EE),
      iconPath: themeProvider.isDarkTheme
          ? 'assets/icons/message-favorite-dark.svg'
          : 'assets/icons/message-favorite.svg',
      onTap: () {},
    ),
    ActionCard(
      title: 'Locate a Pharmacy',
      subtitle: 'Purchase Medicines',
      getColor: (ctx) =>
          themeProvider.isDarkTheme ? const Color(0xFF7A271A) : const Color(0xFFFEF3F2),
      iconPath: themeProvider.isDarkTheme
          ? 'assets/icons/building-dark.svg'
          : 'assets/icons/building.svg',
      onTap: () {},
    ),
  ];
}

}