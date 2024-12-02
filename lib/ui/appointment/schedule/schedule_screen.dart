import 'package:finpro_app/consts.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedDateIndex = 0; // default tanggal pertama
  int selectedTimeIndex = -1; // default waktu belum dipilih

  final List<Map<String, String>> dates = [
    {'day': 'Wed', 'date': '10'},
    {'day': 'Thu', 'date': '11'},
    {'day': 'Fri', 'date': '12'},
    {'day': 'Sat', 'date': '13'},
    {'day': 'Sun', 'date': '14'},
    {'day': 'Mon', 'date': '15'},
  ];

  final List<String> morningTimes = ['10:00', '11:00', '12:00', '13:30'];
  final List<String> afternoonTimes = ['18:00', '19:00', '20:00'];

  // Waktu yang dinonaktifkan
  final List<String> disabledTimes = ['11:00', '18:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Make Appointment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your visit date & Time',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You can choose the date and time from the available doctor\'s schedule',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Choose Day, Jan 2024',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // Pilihan hari dan tanggal dalam scroll horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: dates.asMap().entries.map((entry) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: _buildSelectableTile(
                    entry.key,
                    entry.value['day']!,
                    entry.value['date']!,
                    selectedDateIndex == entry.key,
                    () => setState(() => selectedDateIndex = entry.key),
                  ),
                )).toList(),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Morning Set',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildTimeRow(morningTimes, 0),
            const SizedBox(height: 25),
            const Text(
              'Afternoon Set',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildTimeRow(afternoonTimes, morningTimes.length),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: selectedTimeIndex == -1 
                ? null 
                : () { 
                  // Navigasi ke payment screen tanpa kirim data
                  Navigator.pushNamed(context, '/payment');
                },
              child: const Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // function buat bikin kotak kecil yang nunjukin tanggal
  Widget _buildSelectableTile(
    int index,
    String topText,
    String bottomText,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 95,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              topText,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              bottomText,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // bikin deretan waktu berdasarkan list yang diatas banget itu
  Widget _buildTimeRow(List<String> times, int startIndex) {
    return Row(
      children: times.asMap().entries.map((entry) {
        final index = entry.key + startIndex;
        final time = entry.value;
        final isDisabled = disabledTimes.contains(time);
        final isSelected = selectedTimeIndex == index;

        return GestureDetector(
          onTap: isDisabled ? null : () => setState(() => selectedTimeIndex = index),
          child: Container(
            width: 70,
            height: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: isDisabled ? Colors.grey[300] : (isSelected ? primaryColor : Colors.white),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDisabled ? Colors.grey : (isSelected ? primaryColor : Colors.grey),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  color: isDisabled ? Colors.grey : (isSelected ? Colors.white : Colors.black),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
