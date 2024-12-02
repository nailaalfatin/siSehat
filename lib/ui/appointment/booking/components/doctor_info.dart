import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Stone Gaze',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text('Ear, Nose & Throat specialist'),
              SizedBox(height: 8),
              Text(
                'IDR 120.000',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
