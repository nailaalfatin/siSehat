import 'package:finpro_app/consts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
 const LoginScreen({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(24.0),
       child: SingleChildScrollView( // tambahin ini
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const SizedBox(height: 80),
             const Text(
               'Welcome Back',
               style: TextStyle(
                 fontSize: 28,
                 fontWeight: FontWeight.bold,
               ),
             ),
             const SizedBox(height: 10),
             const Text(
               'Please enter a form to login this app',
               style: TextStyle(fontSize: 16, color: Colors.grey),
             ),
             const SizedBox(height: 30),
             TextField(
               decoration: InputDecoration(
                 labelText: 'Email or Username',
                 hintText: 'Enter your full name',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12.0),
                 ),
               )
             ),
             const SizedBox(height: 20),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: 'Password',
                 hintText: 'Enter your password',
                 suffixIcon: IconButton(
                   icon: const Icon(Icons.visibility),
                   onPressed: () {},
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12.0),
                 ),
               ),
             ),
             const SizedBox(height: 10),
             Align(
               alignment: Alignment.centerRight,
               child: TextButton(
                 onPressed: () {},
                 child: const Text(
                   'Forgot Password',
                   style: TextStyle(color: primaryColor),
                 ),
               ),
             ),
             const SizedBox(height: 20),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: primaryColor,
                   minimumSize: const Size.fromHeight(50),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                 ),
                 child: const Text(
                   'Sign In',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 14,
                     fontWeight: FontWeight.w700
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 20),
             const Row(
               children: [
                 Expanded(
                   child: Divider(thickness: 1),
                 ),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 8.0),
                   child: Text('OR'),
                 ),
                 Expanded(
                   child: Divider(thickness: 1),
                 ),
               ],
             ),
             const SizedBox(height: 20),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton.icon(
                 onPressed: () {},
                 icon: Image.asset(
                  'assets/images/google-logo.png',
                  width: 24,
                  height: 24,
                ),
                 label: const Text(
                   'Sign in with Google',
                   style: TextStyle(
                     color: primaryColor,
                     fontSize: 14,
                     fontWeight: FontWeight.w700
                   ),
                 ),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                   side: const BorderSide(color: Colors.grey),
                   minimumSize: const Size.fromHeight(50),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 10),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton.icon(
                 onPressed: () {},
                 icon: const Icon(Icons.apple, size: 20, color: Colors.white,),
                 label: const Text(
                   'Sign in with Apple',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 14,
                     fontWeight: FontWeight.w700
                   ),
                 ),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFF1E3EAF),
                   minimumSize: const Size.fromHeight(50),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 20),
             Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text("Don't have an account ? "),
                   TextButton(
                     onPressed: () {
                      Navigator.pushNamed(context, '/register');
                     },
                     child: const Text(
                       'Register',
                       style: TextStyle(
                         color: primaryColor,
                         fontSize: 14,
                         fontWeight: FontWeight.w700
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
   );
 }
}
