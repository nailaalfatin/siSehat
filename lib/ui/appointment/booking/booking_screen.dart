import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/appointment_button.dart';
import 'components/comments.dart';
import 'components/doctor_info.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ear, Nose & Throat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DoctorInfo(),
                const SizedBox(height: 30),
                // Hospital and Working Hours
                // You can keep this section in the main file or separate if needed.
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/hospital.svg',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 10),
                              const Text('Hospital')
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'RS. Hermina',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/time.svg',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 10),
                              const Text('Working Hour')
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '07.00 - 18.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Biography',
                  style: TextStyle(
                    fontSize: 17, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Dr. Patricia Ahoy specialist in Ear, Nose & Throat, and work in RS. Hermina Malang. It is a long established fact that a reader will be distracted by the readable content.',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Work Location',
                  style: TextStyle(
                    fontSize: 17, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Jl. Raya Jonggol-Dayeuh, Sukanegara, Kec. Jonggol, Kabupaten Bogor, Jawa Barat 16830',
                ),
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: const Center(child: Text('Map Placeholder')),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rating (72)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/star-half.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text('4.5'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Comments(),
                const SizedBox(height: 50),
              ],
            ),
          ),
          const AppointmentButton(),
        ],
      ),
    );
  }
}