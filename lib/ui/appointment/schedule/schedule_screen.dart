import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
  final themeProvider = Provider.of<ThemeProvider>(context);

   return Scaffold(
     appBar: AppBar(
       backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
       title: Text('Make Appointment', style: TextStyle(fontWeight: FontWeight.bold, color: themeProvider.isDarkTheme ? Colors.white : textColor)),
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
          Text(
             'Select your visit date & Time',
             style: TextStyle(
               color: themeProvider.isDarkTheme ? Colors.white : textColor,
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
          Text(
             'Choose Day, Jan 2024',
             style: TextStyle(
               fontSize: 17,
               fontWeight: FontWeight.bold,
               color: themeProvider.isDarkTheme ? Colors.white : textColor,
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
                   entry.key, //indeks tanggal (kayak nomor urut tanggalnya dalam list)
                   entry.value['day']!,
                   entry.value['date']!,
                   selectedDateIndex == entry.key, //ngecek apakah tanggal itu dipilih atau nggak. Kalau iya, berarti dia bakal di-highlight.
                   () => setState(() => selectedDateIndex = entry.key),
                 ),
               )).toList(),
             ),
           ),
           const SizedBox(height: 30),
          Text(
             'Morning Set',
             style: TextStyle(
               fontSize: 17,
               fontWeight: FontWeight.bold,
               color: themeProvider.isDarkTheme ? Colors.white : textColor,
             ),
           ),
           const SizedBox(height: 10),
           _buildTimeRow(morningTimes, 0),
           const SizedBox(height: 25),
          Text(
             'Afternoon Set',
             style: TextStyle(
               fontSize: 17,
               fontWeight: FontWeight.bold,
               color: themeProvider.isDarkTheme ? Colors.white : textColor,
             ),
           ),
           const SizedBox(height: 10),
           _buildTimeRow(afternoonTimes, morningTimes.length),
           const Spacer(),
           ElevatedButton(
             style: ElevatedButton.styleFrom(
               backgroundColor: themeProvider.isDarkTheme ? primaryDarkColor : primaryColor,
               minimumSize: const Size.fromHeight(50),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
             ),
             onPressed: selectedTimeIndex == -1
               ? null
               : () {
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
   final themeProvider = Provider.of<ThemeProvider>(context);

   return GestureDetector(
     onTap: onTap,
     child: Container(
       width: 90,
       height: 95,
       decoration: BoxDecoration(
         color: isSelected
             ? (themeProvider.isDarkTheme ? primaryDarkColor : primaryColor)
             : (themeProvider.isDarkTheme ? Colors.grey[800] : Colors.white),
         borderRadius: BorderRadius.circular(15),
         border: Border.all(
           color: isSelected
               ? (themeProvider.isDarkTheme ? primaryDarkColor : primaryColor)
               : (themeProvider.isDarkTheme ? Colors.grey[600]! : Colors.grey),
         ),
       ),
       padding: const EdgeInsets.symmetric(vertical: 12),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             topText,
             style: TextStyle(
               color: isSelected
                   ? Colors.white
                   : (themeProvider.isDarkTheme ? Colors.white : Colors.black),
             ),
           ),
           const SizedBox(height: 4),
           Text(
             bottomText,
             style: TextStyle(
               color: isSelected
                   ? Colors.white
                   : (themeProvider.isDarkTheme ? Colors.white : Colors.black),
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
       /*
       Ini kayak ngambil tiap waktu dari list times (misalnya ['10:00', '11:00', '12:00']) dan ngasih indeksnya juga, jadi tiap
       waktu bakal punya nomor urut.
        */
       final index = entry.key + startIndex; //buat ngelacak urutan waktu
       final time = entry.value; //ambil waktunya (misalnya 10:00, 11:00, dll) buat diproses.
       final isDisabled = disabledTimes.contains(time); //cek apakah waktu ini ada di list disabledTimes (waktu yang nggak bisa dipilih).
       final isSelected = selectedTimeIndex == index; //cek apakah waktu ini yang dipilih. Kalau iya, isSelected jadi true.


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