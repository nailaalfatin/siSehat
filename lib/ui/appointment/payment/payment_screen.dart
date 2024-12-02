import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
 const PaymentScreen({super.key});


 @override
 State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
 int selectedPaymentMethod = 0; // Index payment method yang dipilih


 final List<Map<String, dynamic>> paymentMethods = [
   {
     'icon': 'assets/icons/credit-card.svg', // Path SVG untuk Credit Card
     'label': 'Credit Card',
   },
   {
     'icon': 'assets/icons/mandiri.svg', // Path SVG untuk Mandiri
     'label': 'Mandiri',
   },
   {
     'icon': 'assets/icons/bca.svg', // Path SVG untuk BCA
     'label': 'BCA',
   },
 ];


 @override
 Widget build(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);

   return Scaffold(
     appBar: AppBar(
      backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
       title: const Text('Payment'),
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
           // Doctor Details
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
               const SizedBox(width: 12),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       const Text('Rating'),
                       const SizedBox(width: 10),
                       SvgPicture.asset('assets/icons/rating-star.svg'),
                       const SizedBox(width: 5),
                       const Text('4.5'),
                     ],
                   ),
                  Text(
                     'Dr. Stone Gaze',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 16,
                       color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                     ),
                   ),
                   const Text(
                     'Ear, Nose & Throat specialist',
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey,
                     ),
                   ),
                 ],
               ),
             ],
           ),
           const SizedBox(height: 40),
           // Schedule
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text(
                 'Schedule Date',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: textColor,
                 ),
               ),
               GestureDetector(
                 onTap: () {},
                 child: const Text(
                   'Edit',
                   style: TextStyle(
                     color: primaryColor,
                     fontSize: 14,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ],
           ),
           const SizedBox(height: 20),
           Row(
             children: [
               SvgPicture.asset('assets/icons/menu-board.svg'),
               const SizedBox(width: 12),
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text(
                     'Appointment',
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey,
                     ),
                   ),
                   Text(
                     'Wednesday, 10 Jan 2024, 11:00',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                     ),
                   ),
                 ],
               ),
             ],
           ),
           const SizedBox(height: 40),
           // Payment Method
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              Text(
                 'Select Payment Method',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                 ),
               ),
               GestureDetector(
                 onTap: () {},
                 child: const Text(
                   'See All',
                   style: TextStyle(
                     color: primaryColor,
                     fontSize: 14,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ],
           ),
           const SizedBox(height: 10),
           Column(
             children: paymentMethods.asMap().entries.map((entry) {
               int index = entry.key;
               Map<String, dynamic> method = entry.value;
               return ListTile(
                 leading: SvgPicture.asset(
                   method['icon'],
                   width: 30,
                   height: 30,
                 ),
                 title: Text(method['label']),
                 trailing: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   mainAxisSize: MainAxisSize.min, // Membuat Row hanya sebesar diperlukan
                   children: [
                     // Untuk radio di sebelah kiri
                     Radio<int>(
                       value: index,
                       groupValue: selectedPaymentMethod,
                       onChanged: (value) {
                         setState(() {
                           selectedPaymentMethod = value!;
                         });
                       },
                     ),
                   ],
                 ),
               );
             }).toList(),
           ),
           const SizedBox(height: 40),
           // Total Payment
           const Text(
             'Total payment',
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
               color: textColor,
             ),
           ),
           const SizedBox(height: 15),
           // Row for consultation fee and IDR 200.000
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text(
                 'Consultation Fee',
                 style: TextStyle(fontSize: 14),
               ),
               Text(
                 'IDR 200.000',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                 ),
               ),
             ],
           ),
           const SizedBox(height: 8),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text(
                 'Admin',
                 style: TextStyle(fontSize: 14),
               ),
               Text(
                 'Free',
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.bold,
                   color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                 ),
               ),
             ],
           ),
           const Spacer(),
           const Divider(thickness: 1),
           const SizedBox(height: 10),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               // Column to show the total amount on a different line
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text(
                     'Total',
                     style: TextStyle(
                       fontSize: 16,
                     ),
                   ),
                   Text(
                     'IDR 200.000',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.bold,
                       color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                     ),
                   ),
                 ],
               ),
               // ElevatedButton with a defined width
               SizedBox(
                 width: 200, // Tentukan lebar tombol "Pay"
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: themeProvider.isDarkTheme ? primaryDarkColor : primaryColor,
                     minimumSize: const Size.fromHeight(50),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                   ),
                   onPressed: () {
                     Navigator.pushNamed(context, '/success');
                   },
                   child: const Text(
                     'Pay',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ],
       ),
     ),
   );
 }
}
