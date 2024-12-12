import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'components/appointment_button.dart';
import 'components/comments.dart';
import 'components/doctor_info.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

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
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Hospital',
                                style: TextStyle(
                                  color: themeProvider.isDarkTheme ? textSecondaryDark : textSecondary
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'RS. Hermina',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeProvider.isDarkTheme ? textPrimaryDark : textColor
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
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Working Hour',
                                style: TextStyle(
                                  color: themeProvider.isDarkTheme ? textSecondaryDark : textSecondary
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                           Text(
                            '07.00 - 18.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeProvider.isDarkTheme ? textPrimaryDark : textColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Biography',
                  style: TextStyle(
                    fontSize: 17, 
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkTheme ? textPrimaryDark : textColor
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dr. Patricia Ahoy specialist in Ear, Nose & Throat, and work in RS. Hermina Malang. It is a long established fact that a reader will be distracted by the readable content.',
                  style: TextStyle(
                    color: themeProvider.isDarkTheme ? textSecondaryDark : textSecondary
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Work Location',
                  style: TextStyle(
                    fontSize: 17, 
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkTheme ? Colors.white : textColor
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Jl. Arjuna Utara No. 2, RT.5/RW.8, Tanah Abang, Kec. Tanah Abang, Kota Jakarta Pusat, DKI Jakarta 10210, Indonesia',
                  style: TextStyle(
                    color: themeProvider.isDarkTheme ? textSecondaryDark : textSecondary
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(-6.260718, 106.832901),
                      initialZoom: 15.0
                    ),
                    children: [
                       TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      const MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(-6.260718, 106.832901), // koordinat rs hermina
                            width: 40, // ukuran marker
                            height: 40, // ukuran marker
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating (72)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkTheme ? textPrimaryDark : textColor,
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
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: themeProvider.isDarkTheme ? textSecondaryDark : textSecondary
                          ),
                        ),
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
