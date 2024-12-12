import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String? selectedSpecialist;

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
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ), // Judul halaman dengan teks tebal
        ),
        centerTitle: true, // Membuat judul di tengah
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Make An appointment with QR',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Wide selection of doctor\'s specialties',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Input your full name',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 23),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Specialist',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Tambahkan Expanded pada GridView
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                children: [
                  _specialistOption('Ear, Nose & Throat', 'assets/images/ear-logo.png'),
                  _specialistOption('Dermato-venerologis', 'assets/images/fingers-logo.png'),
                  _specialistOption('Dentist', 'assets/images/teeth-logo.png'),
                  _specialistOption('Psychiatrist', 'assets/images/brain-logo.png'),
                ],
              ),
              const SizedBox(height: 23),
              const Text(
                'Symptoms',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 8),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Please describe your symptoms',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/qr');
                  },
                  child: const Text(
                    'Scan With QR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specialistOption(String title, String imagePath) {
    final bool isSelected = selectedSpecialist == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSpecialist = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF9F5FF) : Colors.white,
          border: Border.all(
              color: isSelected ? primaryColor : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        imagePath,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Radio<String>(
                  value: title,
                  groupValue: selectedSpecialist,
                  onChanged: (value) {
                    setState(() {
                      selectedSpecialist = value;
                    });
                  },
                  activeColor: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 50),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
