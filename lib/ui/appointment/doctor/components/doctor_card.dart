import 'package:finpro_app/models/doctors.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onTap; // Callback untuk handle klik

  const DoctorCard({required this.doctor, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Aksi ketika kartu diklik
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Doctor Image
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(doctor.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
              const SizedBox(width: 12),
              // Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      doctor.specialist,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "IDR ${doctor.price}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Rating and Star
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    doctor.rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}