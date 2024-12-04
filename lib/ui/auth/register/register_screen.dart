import 'package:finpro_app/consts.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
 //define var
 final _formkey = GlobalKey<FormState>(); //buat ngontrol form nya, ngecek validasi data
 final _fullname = TextEditingController(); //controller buat teks input biar teks nyakut halaman
 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();
 final _confirmPasswordController = TextEditingController();


 RegisterScreen({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold( //widget utama buat ngatur layout
     body: SafeArea( //biar konten layar ga nabrak
      child: SingleChildScrollView( // Biar konten bisa digulung
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFF18181B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Jarak setelah judul
                  Text(
                    "Please enter a form to continue the register",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF3F3F46),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30), // Jarak atas setelah AppBar
              // Form Input
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _fullname,
                      decoration: InputDecoration(
                        labelText: "Enter your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Email
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Enter your Email",
                        fillColor: const Color(0xFF71717A),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Password
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter your password",
                        fillColor: const Color(0xFF71717A),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Confirm Password
                    const Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm your Password",
                        fillColor: const Color(0xFF71717A),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3EAF),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("I have an account ? "),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Sign In',
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
            ],
          ),
        ),
      ),
    ),
  );
 }
}